class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    if params[:search].present?
      @movies = search_basics.paginate(page: params[:page], per_page: 50)
    else
      @movies = Movie.ordered_by_popular.paginate(page: params[:page], per_page: 50)
    end
    json_response(@movies)
  end

  def show
    @detail = MoviedbApiServices::GetMovieServices.new(@movie.uid).call
    json_response(@detail.payload)
  end

  private

  def search_basics
    Movie.where("title like ?", "%#{params[:search]}%").ordered_by_popular
  end

  def set_movie
    @movie = Movie.find_by!(uid: params[:id])
  end
end
