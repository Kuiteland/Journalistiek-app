class UsersController < ApplicationController
  before_action :correct_user,   only: [:show, :edit, :update]

  def index
    @users = User.paginate(page: params[:page], :per_page => 1)
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

      def correct_user
      	@user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end