module UsersHelper
  def follow_button(user)
    if current_user.follows?(user)
      button_to 'unfollow', user_unfollow_path(user)
    else
      button_to 'follow', user_follow_path(user)
    end
  end
end