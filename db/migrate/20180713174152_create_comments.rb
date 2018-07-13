class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :comments, :user_id
  end
end
