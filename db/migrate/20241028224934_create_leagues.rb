class CreateLeagues < ActiveRecord::Migration[7.2]
  def change
    create_table :leagues do |t|
      t.integer :custom_id
      t.string :league_name
      t.string :type
      t.string :country_name

      t.timestamps
    end
  end
end
