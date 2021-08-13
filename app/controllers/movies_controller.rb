class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.order(popularity: :desc).limit(1000)
    if params[:search]
      ids = search_basics
      @movies = @movies.find(ids)
    end
    json_response(@movies)
  end

  def show
    @detail = MoviedbApiServices::GetMovieServices.new(@movie.uid).call
    json_response(@detail)
  end

  private

  def search_basics
    @movies.where(
      "title like ?",
      "%#{params[:search]}%"
    ).pluck(:id)
  end

  def set_movie
    @movie = Movie.find_by!(uid: params[:id])
  end
end
