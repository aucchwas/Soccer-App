class TeamsController < ApplicationController
  def index
    # @league = League.find(params[:league_id])
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end
end
