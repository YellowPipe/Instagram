class CommentsController < ApplicationController
  before_action :find_post
  
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  # def destroy
  #   if @comment.user_id == @current_user_id
  #     @comment.destroy
  #     render json: {}
  #   else
  #     render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
  #   end
  # end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
