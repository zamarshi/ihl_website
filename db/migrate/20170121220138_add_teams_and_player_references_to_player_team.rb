class AddTeamsAndPlayerReferencesToPlayerTeam < ActiveRecord::Migration[5.0]
  def change
    add_reference :player_teams, :player, foreign_key: true
    add_reference :player_teams, :team, foreign_key: true
  end
end
