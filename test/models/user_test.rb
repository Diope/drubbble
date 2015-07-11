require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:tinashe)
  end

  test "Username should not be blank" do
    @user.email = nil
    assert_not @user.valid?
  end
end
