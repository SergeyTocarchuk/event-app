class Event < ApplicationRecord
  belongs_to :user
  has_many :enrollments, dependent: :destroy
  has_many :attendees, through: :enrollments, source: :user
end
