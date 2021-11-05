class Child < ApplicationRecord
  belongs_to :parent
  belongs_to :classroom

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :attendance_status, presence: true
end
