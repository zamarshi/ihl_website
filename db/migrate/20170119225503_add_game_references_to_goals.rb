class AddGameReferencesToGoals < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :game, foreign_key: true
  end
end
