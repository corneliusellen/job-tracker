class Comment < ApplicationRecord
  validates :author, :body, presence: true
end
