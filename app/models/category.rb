class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_and_belongs_to_many :pictures

  def self.top_categories
    self.all.sort {|e| -e.pictures.count}.first(5)
  end
end
