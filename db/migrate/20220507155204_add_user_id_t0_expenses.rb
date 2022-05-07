class AddUserIdT0Expenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :user_id, :integer, unique: true
    add_foreign_key :expenses, :users, column: :user_id
    add_index :expenses, :user_id
  end
end
