class Timeline
  # provides to_partial_path
  # but doesn't seem to work in Rails 4
  extend ActiveModel::Naming

  def initialize(user)
    @user = user
  end

  # this allows us to mess up the model/view distinction - we are giving Rails some information
  # on how to render a service object, ergh
  def to_partial_path
    "timelines/timeline"
  end

  def shouts
    Shout.where(user_id: shout_user_ids)
  end

  private

  # whyyyyyyyyy
  def shout_user_ids
    @user.followed_user_ids + [@user.id]
  end
end