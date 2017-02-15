class AddUserstoPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :user_id, :integer, foreign_key: true
  end
end
