class FollowsController < ApplicationController
  def create
    # current_user.followed_users << target
    current_user.follow target_user
    redirect_to target_user, notice: "Now following #{target_user.username}"
  end

  def destroy
    # current_user.followed_users.delete target
    current_user.unfollow target_user
    redirect_to target_user, notice: "No longer following #{target_user.username}"
  end

  private

  # "extract method" 'pattern'
  def target_user
    @_target_user ||= User.find(params[:user_id])
  end
end