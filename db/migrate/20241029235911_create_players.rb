class CreatePlayers < ActiveRecord::Migration[7.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.integer :number
      t.string :position
      t.string :photo

      t.timestamps
    end
  end
end
