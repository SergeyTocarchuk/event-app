class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "user_id"
  has_many :enrollments, dependent: :destroy
  has_many :events, through: :enrollments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
