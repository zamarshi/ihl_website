class CreateAssists < ActiveRecord::Migration[5.0]
  def change
    create_table :assists do |t|
      t.references :goal, foreign_key: true
      t.timestamps
    end
  end
end
