require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
  end

  test "valid post" do
    assert @post.valid?
  end

  test "invalid without image" do
  	@post.image = nil
    refute @post.valid?
  end
end
