# module definition is not necessary
module Following
  extend ActiveSupport::Concern

  included do
    has_many :follows,
      foreign_key: :source_id,
      class_name: 'Follow'    # also default
    has_many :followed_users,
      through: :follows,
      source: :target
      # also provides followed_user_ids (note pluralisation)

    has_many :reverse_follows,
      foreign_key: :target_id,
      class_name: 'Follow'
    has_many :followers,
      through: :reverse_follows,
      source: :source

    # also available: module ClassMethods
  end

  def follows?(user)
    followed_users.include?(user)
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def can_follow?(user)
    user != self
  end

end

