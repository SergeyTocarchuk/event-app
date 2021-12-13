class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :body
      t.date :date

      t.timestamps
    end
  end
end
