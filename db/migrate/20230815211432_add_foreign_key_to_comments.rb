class AddForeignKeyToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :bigint
    add_foreign_key :comments, :users
    add_column :comments, :post_id, :bigint
    add_foreign_key :comments, :posts
  end
end
