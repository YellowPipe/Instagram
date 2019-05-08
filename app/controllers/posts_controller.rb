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
    authorize @post
  end

  def update
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_show_url(current_user.id), notice: 'Post was successfully created.'
    else
      render :edit
    end
  end

  def show
    @comments = @post.comments
  end

  def index
    @posts = current_user.feed.order(created_at: :desc)
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to user_show_url(current_user.id), notice: 'Post was successfully deleted.'
  end

  private

  def set_post
	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:description, :image)
  end

end
