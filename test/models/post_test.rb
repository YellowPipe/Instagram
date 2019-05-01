require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
  	@post = @user.posts.build(image:'www.picture.jpg')
  end

  test "valid post" do
    assert @post.valid?
  end

  test "invalid without image" do
  	@post.image = nil
    refute @post.valid?
  end

  test "invalid without user_id" do
    @post.user_id = nil
    refute @post.valid?
  end
end
