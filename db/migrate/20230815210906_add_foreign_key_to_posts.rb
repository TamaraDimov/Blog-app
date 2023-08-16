class AddForeignKeyToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author_id, :bigint
    add_foreign_key :posts, :users, column: :author_id
  end
end
