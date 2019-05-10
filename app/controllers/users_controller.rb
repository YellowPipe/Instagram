class UsersController < ApplicationController
  before_action :set_user, only: [:show, :settings]
  
  def index
  	@users = User.all
  end

  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  def settings
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

end
