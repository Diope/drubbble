class UsersController < ApplicationController

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render "show_followers"
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page])
  end
end
