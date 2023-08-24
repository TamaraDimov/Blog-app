class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  attribute :post_counter, default: 0
  # Get the most recent 5 posts
  def self.recent_posts
    order(created_at: :desc).limit(5)
  end

  after_save :increment_post_counter_for_user

  # private

  # Increment the Post_counter for the author
  def increment_post_counter_for_user
    author.increment(:post_counter)
  end
  

  after_save :update_post_counter_for_author

  # private
  
  def update_post_counter_for_author
    author.update_column(:post_counter, author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
