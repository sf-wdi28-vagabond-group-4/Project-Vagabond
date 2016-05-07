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
      flash.now[:notice] = "Email already in use"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to @user
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :image)
  end

end
