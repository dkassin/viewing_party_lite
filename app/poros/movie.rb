class Movie
  attr_reader :original_title, :original_language, :vote_count

  def initialize(data)
    @title = data[:original_title]
    @lang = data[:original_language]
    @vote = data[:vote_count]
    # @summary = data[:summary]
    # @cast = data[:cast]
  end
end
