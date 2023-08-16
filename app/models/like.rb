class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  # Set a default value of 0 for CommentsCounter and LikesCounter
  attribute :LikesCounter, default: 0
  after_save :increment_likes_counter_for_post

  private

  # Increment the LikesCounter
  def increment_likes_counter_for_post
    post.increment(:LikesCounter, 1)
  end
end
