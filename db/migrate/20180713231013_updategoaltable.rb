class Updategoaltable < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :private, :boolean
    add_column :comments, :goal_id, :integer
    add_column :goals, :completed, :boolean
    add_index :comments, :goal_id
  end
end
