class ChangeColumnTypeToListings < ActiveRecord::Migration
  def change
    change_column :listings, :daily_price, "decimal USING daily_price::numeric(15,2)"
    change_column :listings, :size, "decimal USING daily_price::numeric(15,2)"
    # change_column :listings, :daily_price, :decimal, precision: 15, scale: 2
    # change_column :listings, :size,  :decimal, precision: 15, scale: 2
  end
end
