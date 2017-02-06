class AddCurrentColumnToSeasons < ActiveRecord::Migration[5.0]
  def change
    add_column :seasons, :current_season, :boolean, default: false
  end
end
