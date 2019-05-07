class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    unless current_user.liked?(@post)
      current_user.like(@post)
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end
  end

  def destroy
    if current_user.liked?(@post)
      @like.destroy
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
   @like = @post.likes.find(params[:id])
  end
end
