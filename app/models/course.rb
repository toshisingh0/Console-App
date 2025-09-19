class Course < ApplicationRecord
 validates :title, presence: true
 validates :code, presence: true, uniqueness: true
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments


end
