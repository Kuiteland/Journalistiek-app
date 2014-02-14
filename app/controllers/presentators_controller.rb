class PresentatorsController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy,
  										:update, :edit]

  def index
    @presentators = Presentator.paginate(page: params[:page], :per_page => 2)
  end

  def show
  	@user = Presentator.find(params[:id])
  end

  def new
    @user = Presentator.new
  end

  def edit
  	@user = Presentator.find(params[:id])
  end

  def update
    @user = Presentator.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile pdated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    Presentator.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def create
    @user = Presentator.new(user_params)
    if @user.save
      flash[:success] = "Profile created"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:presentator).permit(:name, :email)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
