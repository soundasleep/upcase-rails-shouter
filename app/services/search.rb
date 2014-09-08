class Search
  attr_reader :q

  def initialize(options = {})
    @q = options.fetch(:q, "")
  end

  def shouts
    Shout.text_shouts.where(content_id: text_shouts)
  end

  private

  def text_shouts
    TextShout.where("body LIKE ?", "%#{q}%")
  end
end
