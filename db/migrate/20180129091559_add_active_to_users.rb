class AddActiveToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :active, :boolean
    add_index :users, [:email, :active], unique: true
  end
end
