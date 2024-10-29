class TeamsController < ApplicationController
  def index
    # @league = League.find(params[:league_id])
    # @teams = Team.all
    if params[:query].present?
      @teams = Team.search(params[:query]).page(params[:page]).per(5)
    else
      @teams = Team.page(params[:page]).per(5)
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def search
    @teams = Team.search(params[:query]).page(params[:page]).per(5)
    render :index
  end
end
