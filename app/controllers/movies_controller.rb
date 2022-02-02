class MoviesController < ApplicationController
  def search

    conn = Faraday.get("https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
    
    response = conn.get("/3/search/movie?query=Aliens&api_key=6bb70d8448dabf0d4dbdfa9e215e1826")
    binding.pry
    ata = JSON.parse(response.body, symbolize_names: true)
    @movie = data[:results][0][:original_title]
  end
end
