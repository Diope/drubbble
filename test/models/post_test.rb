require 'test_helper'
include Devise::TestHelpers

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "James", email: "james@xo.com", password: "password", password_confirmation: "password")
    @post = @user.posts.build(title: "Cherry Filter!", content: "Made in Korea?", user_id: @user.id)
  end

  test "Should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = " "
    assert_not @post.valid?
  end

  test "content should be at most 600 characters" do
    @post.content = "a" * 601
    assert_not @post.valid?
  end

end
