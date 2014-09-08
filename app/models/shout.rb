class Shout < ActiveRecord::Base
  belongs_to :user

  default_scope do
    order("created_at DESC")
  end

  belongs_to :content, polymorphic: true
  validates_associated :content

  # from sunspot_rails
  searchable do
    text :content do
      content.index
    end
  end

  # def self.search(term)
  #   ids = TextShout.where("body LIKE ?", "%#{term}%")
  #   text_shouts.where(content_id: ids)
  # end

  def self.text_shouts
    where(content_type: "TextShout")
  end
end
