class Classroom < ApplicationRecord
  has_many :children
  has_many :teachers
  has_many :events

  validates :name, presence: true
end
