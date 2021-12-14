class AddEventToEnrollments < ActiveRecord::Migration[6.1]
  def change
    add_reference :enrollments, :event, null: false, foreign_key: true
  end
end
