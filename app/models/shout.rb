class Shout < ActiveRecord::Base
  belongs_to :user

  default_scope do 
    order("created_at DESC")
  end

  belongs_to :content, polymorphic: true
end
