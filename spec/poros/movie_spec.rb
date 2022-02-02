require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      original_title: "Cowboys & Aliens",
      original_language: "en",
      vote_count: 4200,
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.original_title).to eq("Cowboys & Aliens")
    expect(movie.original_language).to eq("en")
    expect(movie.vote_count).to eq("4200")
  end
end
