class RegisseursController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy,
  										:update, :edit]

  def index
    @users = Regisseur.paginate(page: params[:page], :per_page => 2)
  end

  def show
  	@user = Regisseur.find(params[:id])
  end

  def new
    @user = Regisseur.new
  end

  def edit
  	@user = Regisseur.find(params[:id])
  end

  def update
    @user = Regisseur.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    Regisseur.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def create
    @user = Regisseur.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:regisseur).permit(:name, :email)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
