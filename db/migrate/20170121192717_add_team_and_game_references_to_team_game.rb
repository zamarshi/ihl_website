class AddTeamAndGameReferencesToTeamGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :team_games, :team, foreign_key: true
    add_reference :team_games, :game, foreign_key: true
  end
end
