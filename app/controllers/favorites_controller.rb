class FavoritesController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
  	@favorite = current_user.favorites
    json_response(@favorite)
  end

  def show
  	json_response(@favorite)
  end

  def create
  	@favorite = current_user.favorites.create!(favorite_params)
    json_response(@favorite, :created)
  end

  private

  def favorite_params
    params.permit(:movie_id, :user_id)
  end

  def set_todo
    @favorite = Favorite.find(params[:id])
  end
end
