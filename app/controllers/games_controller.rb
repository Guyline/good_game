class GamesController < ApplicationController
  def index
    search_query = params[:query]
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    @games = Game.includes(:platforms, :publishers, :developers).paginate(:page => page, :per_page => per_page)
    @games = @games.where("games.name LIKE ?", "%#{search_query}%") if search_query.present?

    respond_to do |format|
      format.html
    end
  end

  def show
    @game = Game.where(:id => params[:id]).
      includes(:platforms, :publishers, :developers).
      first

    respond_to do |format|
      format.html
    end
  end
end