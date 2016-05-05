class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if User.exists?(:email => @user.email)
      login(@user)
      redirect_to @user
    else
      flash[:notice] = "Email already in use"
      redirect_to login_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
