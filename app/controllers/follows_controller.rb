class FollowsController < ApplicationController
  def create
    target = User.find(params[:user_id])
    current_user.followed_users << target
    redirect_to target
  end

  def destroy
    target = User.find(params[:user_id])
    current_user.followed_users.delete target
    redirect_to target
  end
end