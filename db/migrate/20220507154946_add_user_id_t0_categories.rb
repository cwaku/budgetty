class AddUserIdT0Categories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :user_id, :integer, unique: true
    add_foreign_key :categories, :users, column: :user_id
    add_index :categories, :user_id
  end
end
