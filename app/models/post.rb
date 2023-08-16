class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :Title, presence: true 
  validates :Title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  attribute :Post_counter, default: 0
  # Get the most recent 5 posts
  def self.recent_posts
    order(created_at: :desc).limit(5)
  end

  after_save :increment_post_counter_for_user

  private

  # Increment the Post_counter for the author
  def increment_post_counter_for_user
    author.increment(:Post_counter, 1)
  end
end
