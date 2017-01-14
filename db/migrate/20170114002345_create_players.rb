class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.datetime :date_of_birth
      t.timestamps
    end
  end
end
