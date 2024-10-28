class RenameTypeColumnInLeagues < ActiveRecord::Migration[7.2]
  def change
    rename_column :leagues, :type, :league_type
  end
end
