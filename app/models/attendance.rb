class Attendance < ApplicationRecord
  belongs_to :child
  belongs_to :classroom


  validates :date, presence: true
  enum status: [:present, :absent, :tardy]
  # validates :classroom_id, presence: true
  # validates :parent_id, presence: true
end
