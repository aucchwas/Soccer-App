class AddTeamIdToTeams < ActiveRecord::Migration[7.2]
  def change
    add_column :teams, :team_id, :integer
  end
end
