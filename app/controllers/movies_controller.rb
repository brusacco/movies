class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
  	@movies = Movie.order(popularity: :desc).limit(10)
  	json_response(@movies)
  end

  def show
  	@detail = MoviedbApiServices::GetMovieServices.new(@movie.uid).call
    json_response(@detail)
  end

  private

  def set_movie
    @movie = Movie.find_by(uid: params[:id])
  end
end
