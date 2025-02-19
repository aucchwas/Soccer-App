class TeamsController < ApplicationController
  def index
    # @league = League.find(params[:league_id])
    # @teams = Team.all
    if params[:query].present?
      @teams = Team.search(params[:query]).page(params[:page]).per(16)
    else
      @teams = Team.order(points: :desc).page(params[:page]).per(16)
    end
  end

  def show
    @team = Team.find(params[:id])
    @teams = Team.order(points: :desc)
  end

  def search
      @teams = Team.where("team_name LIKE ?", "%"+ params[:q]+ "%")
      render :search
  end
end
