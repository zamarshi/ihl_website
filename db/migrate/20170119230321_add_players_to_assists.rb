class AddPlayersToAssists < ActiveRecord::Migration[5.0]
  def change
    add_reference :assists, :player, foreign_key: true
    
  end
end
