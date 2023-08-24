class ChangePostCounter < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :post_counter, :integer, default: 0
    change_column :posts, :commentsCounter, :integer, default: 0
    change_column :posts, :likesCounter, :integer, default: 0
  end
end

