class Picture < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :score, numericality: true, inclusion: {in: 1..5}
  has_one_attached :picture
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :albums
  has_many :comments
  belongs_to :album, optional: true

  scope :top, -> {where('score >= ?',4)}
end
