class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  # Set a default value of 0 for CommentsCounter and LikesCounter
  attribute :likesCounter, default: 0
  # after_save :increment_likes_counter_for_post

  # private

  # Increment the LikesCounter
  def increment_likes_counter_for_post
    post.increment(:likesCounter, 1)
  end

  after_commit :update_likes_counter, on: %i[create destroy]

  def update_likes_counter
    post.update(likesCounter: post.likes.count)
  end
end
