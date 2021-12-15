class Event < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
end
