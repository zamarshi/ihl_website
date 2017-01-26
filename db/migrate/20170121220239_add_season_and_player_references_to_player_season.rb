class AddSeasonAndPlayerReferencesToPlayerSeason < ActiveRecord::Migration[5.0]
  def change
    add_reference :player_seasons, :player, foreign_key: true
    add_reference :player_seasons, :season, foreign_key: true
  end
end
