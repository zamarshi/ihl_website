class AddOvertimeToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :overtime, :boolean
  end
end
