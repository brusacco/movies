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
  	@favorite = current_user.favorites.create!(movie_id: params[:id])
    json_response(@favorite, :created)
  end

  def list
  	@user = User.find(params[:id])
  	@favorite = @user.favorites
    json_response(@favorite)
  end

  private

  def set_todo
    @favorite = Favorite.find(params[:id])
  end
end
