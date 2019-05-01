class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:index, :show]
  def new
  	@post = Post.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  	@posts = Post.all
  end

  private

  def set_post
	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:description, :image)
  end

end
