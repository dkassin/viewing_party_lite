class MoviesController < ApplicationController
  # def index
  #   conn = Faraday.new("https://api.themoviedb.org") do |faraday|
  #     faraday.params['api_key'] = ENV['movie_api_key']
  #   end
  #
  #   response = conn.get("/3/search/movie?query=Aliens&api_key=6bb70d8448dabf0d4dbdfa9e215e1826")
  #   data = JSON.parse(response.body, symbolize_names: true)
  #
  #   @movies = data[:results]
  #
  # end

  def search
    @user = User.find(params[:id])
    conn = Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response = conn.get("/3/search/movie?query=#{params[:search]}&api_key=6bb70d8448dabf0d4dbdfa9e215e1826")
    data = JSON.parse(response.body, symbolize_names: true)

    movie = data[:results]

    @found_movie = movie.find {|m| m[:original_title] == params[:search]}
    @movie = @found_movie[:original_title]
    binding.pry
    render "/users/#{@user.id}/discover"
  end
end
