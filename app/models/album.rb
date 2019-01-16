class Album < ApplicationRecord
  has_and_belongs_to_many :pictures
  belongs_to :user, optional: true
end
