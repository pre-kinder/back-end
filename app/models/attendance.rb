class Attendance < ApplicationRecord
  belongs_to :child
  belongs_to :classroom

  validates :classroom_id, presence: true
  validates :child_id, presence: true
  validates :date, presence: true
  validates :notes, presence: true
  validates :status, presence: true
  enum status: [:present, :absent, :late, :sick]
end
