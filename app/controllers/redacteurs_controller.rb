class RedacteursController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy,
  										:update, :edit]

  def index
    @redacteurs = Redacteur.paginate(page: params[:page], :per_page => 2)
  end

  def show
  	@user = Redacteur.find(params[:id])
  end

  def new
    @user = Redacteur.new
  end

  def edit
  	@user = Redacteur.find(params[:id])
  end

  def update
    @user = Redacteur.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile pdated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    Redacteur.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def create
    @user = Redacteur.new(user_params)
    if @user.save
      flash[:success] = "Profile created"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:redacteur).permit(:name, :email)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
