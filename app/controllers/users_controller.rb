class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]
  before_action :find_user, only: [:show, :password]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = "New User Created!"
      login(@user)
      redirect_to @user
    else
      flash[:error] = "Email is already taken"
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts.all.order("created_at desc")
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    flash[:notice] = "Update Successful!"
    redirect_to @user
  end

  def password
    if @user == current_user
      @user = User.find_by_id(params[:id])
    else
      redirect_to root_path
    end
  end

  def password_update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    flash[:notice] = "Update Successful!"
    redirect_to @user
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :image)
    end

    def find_user
    # This assumes you have an association set up as needed
      @user = User.find_by_id(params[:id])

      if @user.nil?
        redirect_to root_path
      end
    end

end
