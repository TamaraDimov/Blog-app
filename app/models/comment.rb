class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  # Set a default value of 0 for CommentsCounter and LikesCounter
  attribute :commentsCounter, default: 0
  after_save :increment_comments_counter_for_post
  # Increment the CommentsCounter

  private

  def increment_comments_counter_for_post
    post.increment(:commentsCounter, 1)
  end
end
