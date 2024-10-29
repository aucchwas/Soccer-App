class TeamsController < ApplicationController
  def index
    # @league = League.find(params[:league_id])
    # @teams = Team.all
    @teams = Team.page(params[:page]).per(16)
  end

  def show
    @team = Team.find(params[:id])
  end
end
