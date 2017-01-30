class AddSeasonReferencesToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :season, foreign_key: true
  end
end
