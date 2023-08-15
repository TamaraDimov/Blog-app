class AddForeignKeyToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :user_id, :bigint
    add_foreign_key :likes, :users
    add_column :likes, :post_id, :bigint
    add_foreign_key :likes, :posts
  end
end
