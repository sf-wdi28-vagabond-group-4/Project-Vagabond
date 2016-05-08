class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = "Email is already taken"
      render :new
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
    flash[:notice] = "Update Successful!"
    redirect_to @user
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :image)
    end

end
