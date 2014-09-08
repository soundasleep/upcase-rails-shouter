class Search
  attr_reader :hashtag

  def initialize(options = {})
    @hashtag = options.fetch(:term, "")
  end

  def shouts
    Shout.text_shouts.where(content_id: text_shouts)
  end

  private

  def text_shouts
    TextShout.where("body LIKE ?", "%#{hashtag}%")
  end
end
