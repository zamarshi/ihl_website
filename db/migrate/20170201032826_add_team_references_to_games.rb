class AddTeamReferencesToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :home_team_id, :integer, foreign_key: true
    add_column :games, :away_team_id, :integer, foreign_key: true
  end
end
