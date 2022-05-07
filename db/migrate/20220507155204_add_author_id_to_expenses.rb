class AddAuthorIdToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :author_id, :integer, unique: true
    add_foreign_key :expenses, :users, column: :author_id
    add_index :expenses, :author_id
  end
end