class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  attribute :commentsCounter, default: 0

  after_commit :update_comments_counter_for_post, on: %i[create destroy]

  private

  # Increment and update the comments counter for the associated post
  def update_comments_counter_for_post
    increment_comments_counter
    update_comments_counter
  end

  def increment_comments_counter
    post.increment(:commentsCounter, 1)
  end

  def update_comments_counter
    post.update(commentsCounter: post.comments.count)
  end
end
