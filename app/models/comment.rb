class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :food

  validates :comment_content, presence: true
end
