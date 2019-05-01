require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
  	@user = users(:valid)
  	@second = users(:second)
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without email" do
  	@user.email = nil
    refute @user.valid?
  end

  test "invalid without username" do
  	@user.username = nil
    refute @user.valid?
  end

  test "invalid with not unique username" do
  	@second.username = 'john1'
    refute @second.valid?
  end

  test "should follow and unfollow a user" do
    first = users(:valid)
    second  = users(:second)
    assert_not first.following?(second)
    first.follow(second)
    assert second.followers.include?(first)
    assert first.following?(second)
    first.unfollow(second)
    assert_not first.following?(second)
  end

end
