class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :goal
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
