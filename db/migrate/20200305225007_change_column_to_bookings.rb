class ChangeColumnToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :user, :string
    # add_column :bookings, :customer_id, :integer
    add_reference :bookings, :customer, foreign_key: { to_table: :customer }
  end
end
