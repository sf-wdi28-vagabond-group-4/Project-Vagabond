class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @city = City.find(params[:city_id])
    @comment = @post.comments.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash.now[:notice] = "Comment Added"
      redirect_to city_post_path(@city, @post)
    else
      flash.now[:error] = @comment.errors.full_messages
      redirect_to city_post_path(@city, @post)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

end
