class CreatePlayerSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :player_seasons do |t|

      t.timestamps
    end
  end
end
