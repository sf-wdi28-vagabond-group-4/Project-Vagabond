class PostsController < ApplicationController

  before_action :set_city
  before_action :find_post, only: [:show, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by_id(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = @city.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "New Post Created!"
      redirect_to city_path(@city)
    else
      flash[:error] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = @city.posts.find(params[:id])
    @user = User.find_by_id(@post.user_id)
    if @user != current_user
      redirect_to root_path
    end
    # unless current_user.id == @post.user.id
    #   render :show
    #   flash[:error] = "Not allowed to edit others post"
    # end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to city_post_path(@city, @post)
  end

  def destroy
    if @user == current_user
      @post = Post.find(params[:id])

      if @post.destroy
        flash[:error] = "Deleted Post!"
      redirect_to user_path(current_user)
      else
        flash[:error] = @post.errors.full_messages
      end
    else
      redirect_to root_path
    end
  end


  private

    def set_city
      @city = City.find(params[:city_id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :city_id, :user_id)
    end

    def find_post
    # This assumes you have an association set up as needed
      @post = Post.find_by_id(params[:id])

      if @post.nil?
        redirect_to root_path
      end
    end

end
