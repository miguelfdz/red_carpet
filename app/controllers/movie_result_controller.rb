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
      json = MovieResults::MetacriticApi.scrap(@movie_result.movie_title)
      redirect_to new_movie_result_path(:json => json )
    end
  end

  private
  def get_params(params)
    {
      "movie_title" => params[:movie_title]
    }
  end
end