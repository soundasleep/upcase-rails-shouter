class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true

  has_many :shouts
  has_many :follows, foreign_key: :source_id
  has_many :followed_users, through: :follows, source: :target
    # also provides followed_user_ids (note pluralisation)

  has_many :reverse_follows, foreign_key: :target_id, class_name: 'Follow'
  has_many :followers, through: :reverse_follows, source: :source

  def follows?(user)
    followed_users.include?(user)
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end
end
