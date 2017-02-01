class DropTeamGamesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :team_games
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
