class AddPostedPostCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :posted_post_count, :integer, default: 0
  end
end
