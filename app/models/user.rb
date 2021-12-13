class User < ApplicationRecord
  has_many :events
  has_many :enrollments, dependent: :destroy
  has_many :attended_events, through: :enrollments, source: :event

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
