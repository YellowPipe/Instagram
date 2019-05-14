class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    if !@comment.save
      flash[:error] = "Comment can't be blank"
    end
    redirect_back(fallback_location: root_path, notice: 'Comment was successfully created.')
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    authorize @comment
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: 'Comment was successfully deleted.')
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
