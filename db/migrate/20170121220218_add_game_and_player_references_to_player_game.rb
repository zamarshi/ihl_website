class AddGameAndPlayerReferencesToPlayerGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :player_games, :player, foreign_key: true
    add_reference :player_games, :game, foreign_key: true
  end
end
