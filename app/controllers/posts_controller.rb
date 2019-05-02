class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]
 
  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
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
