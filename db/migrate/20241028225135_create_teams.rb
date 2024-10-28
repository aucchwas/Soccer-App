class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :points
      t.integer :goal_diff

      t.timestamps
    end
  end
end
