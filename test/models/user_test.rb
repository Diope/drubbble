require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Should follow and unfollow users" do
    tinashe = User.create(username: "Tinashe", email: "tina@gold.com", password: "password", password_confirmation: "password")
    jennie = User.create(username: "Jennieblood", email: "jennie@hello.com", password: "password", password_confirmation: "password")
    assert_not tinashe.following?(jennie)
    tinashe.follow(jennie)
    assert tinashe.following?(jennie)
    assert jennie.followers.include?(tinashe)
    tinashe.unfollow(jennie)
    assert_not tinashe.following?(jennie)
  end
end
