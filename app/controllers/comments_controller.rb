class CommentsController < ApplicationController
  before_action :find_post
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
    else
      flash[:error] = 'Error occured on creating comment'
    end
    redirect_to @post
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
    params.require(:comment).permit(:body, :post_id)
  end

  def find_post
    @post = Post.find(params[:comment][:post_id])
  end

end
