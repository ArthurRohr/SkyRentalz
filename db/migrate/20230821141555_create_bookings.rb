class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.references :user, null: false, foreign_key: true
      t.references :jet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
