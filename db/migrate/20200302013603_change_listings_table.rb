class ChangeListingsTable < ActiveRecord::Migration
  def change
    change_column_null :listings, :name, false
    change_column_null :listings, :address, false
    change_column_null :listings, :city, false
    change_column_null :listings, :state, false
    change_column_null :listings, :zipcode, false
    change_column_null :listings, :daily_price, false
    add_column :listings, :size, :string, null: false
  end
end
