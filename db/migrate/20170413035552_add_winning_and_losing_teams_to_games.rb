class AddWinningAndLosingTeamsToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :winning_team_id, :integer, foreign_key: true
    add_column :games, :losing_team_id, :integer, foreign_key: true
  end
end
