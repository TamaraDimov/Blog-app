class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :Text, :text
    rename_column :posts, :Title, :title
    rename_column :posts, :Text, :text
    rename_column :posts, :CommentsCounter, :commentsCounter
    rename_column :posts, :LikesCounter, :likesCounter
    rename_column :users, :Name, :name
    rename_column :users, :Photo, :photo
    rename_column :users, :Bio, :bio
    rename_column :users, :Post_counter, :post_counter
  end
end
