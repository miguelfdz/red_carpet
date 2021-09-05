require 'json'
require 'rest-client'

class MovieResultController < ApplicationController
  def new
    @movie_result = MovieResult.new()
    search = [params[:json]]
  end

  def create
    @movie_result = MovieResult.new(get_params(params[:movie_result]))
    if @movie_result.save
      json_meta = MovieResults::MetacriticApi.scrap(@movie_result.movie_title)["data"]["meta_critic_result"]
      json_rotten = MovieResults::RottenTomatoesApi.scrap(@movie_result.movie_title)["data"]
      json_imdb = MovieResults::ImdbApi.scrap(@movie_result.movie_title)["data"]["movie"]
      redirect_to new_movie_result_path(:json_meta => json_meta, :json_rotten => json_rotten, :json_imdb => json_imdb), method: :patch
    end
  end

  private
  def get_params(params)
    {
      "movie_title" => params[:movie_title]
    }
  end
end