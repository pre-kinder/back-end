class Child < ApplicationRecord
  belongs_to :parent
  belongs_to :classroom
  has_many :attendances

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :classroom_id, presence: true
  validates :parent_id, presence: true
end
