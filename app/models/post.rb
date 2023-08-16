class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  attribute :Post_counter, default: 0

  # Increment the Post_counter for the author
  def increment_post_counter_for_user
    author.increment(:Post_counter, 1)
  end

  # Get the most recent 5 posts
  def self.recent_posts
    order(created_at: :desc).limit(5)
  end
end
