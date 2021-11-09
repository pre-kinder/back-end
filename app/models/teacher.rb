class Teacher < ApplicationRecord
  belongs_to :classroom

  validates :classroom_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :google_image_url, presence: true
  validates :google_id, presence: true
end
