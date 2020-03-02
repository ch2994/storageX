class ChangeListingsTable < ActiveRecord::Migration
  def change
    change_column_null :listings, :name, true
    change_column_null :listings, :address, true
    change_column_null :listings, :city, true
    change_column_null :listings, :state, true
    change_column_null :listings, :zipcode, true
    change_column_null :listings, :daily_price, true
    add_column :listings, :size, :string, null: true
  end
end
