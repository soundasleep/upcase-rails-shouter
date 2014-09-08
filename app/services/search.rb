class Search
  attr_reader :q

  def initialize(options = {})
    @q = options.fetch(:q, "")
  end

  def shouts
    Shout.search do
      fulltext q
    end.results
  end
end
