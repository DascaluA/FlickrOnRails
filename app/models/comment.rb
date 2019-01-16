class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user, optional: true
  validates :content, presence: true, length: { minimum: 10 }
  validates :owner, presence: true
end
