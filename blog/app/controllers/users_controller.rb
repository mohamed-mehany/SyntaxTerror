class UsersController < ApplicationController
  def index
    if current_user.try(:admin)
	   @users = User.all
   elsif current_user
     redirect_to current_user
   else
     redirect_to root_path()
   end
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def set_auth
    if (current_user && current_user.admin)
      @user = User.find(params[:id])
      @user.auth = true
      @user.save
      redirect_to users_path()
    else
      redirect_to root_path(), notice: "You are not allowed to authenticate."
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
