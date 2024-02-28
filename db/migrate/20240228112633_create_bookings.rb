class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.boolean :confirmation
      t.text :comment
      t.date :renting_start
      t.date :renting_end
      t.references :user, null: false, foreign_key: true
      t.references :furniture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
