class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  
  def index
  	@users = User.all
  end

  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  def settings
  end

  def followers
    @users = @user.followers
  end

  def following
    @users = @user.following
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

end
