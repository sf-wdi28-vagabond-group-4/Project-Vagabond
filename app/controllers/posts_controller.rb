class PostsController < ApplicationController

  before_action :set_city

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @city.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to city_path(@city)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def set_city
    @city = City.find(params[:city_id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :city_id, :user_id)
  end


end
