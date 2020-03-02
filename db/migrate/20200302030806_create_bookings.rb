class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :user
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
