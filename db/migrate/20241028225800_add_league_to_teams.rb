class AddLeagueToTeams < ActiveRecord::Migration[7.2]
  def change
    add_reference :teams, :league, null: false, foreign_key: true
  end
end
