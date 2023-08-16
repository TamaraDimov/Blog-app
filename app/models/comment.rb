class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  has_many :likes
end
