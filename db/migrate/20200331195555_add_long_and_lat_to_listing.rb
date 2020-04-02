class AddLongAndLatToListing < ActiveRecord::Migration
  def change
    add_column :listings, :lat, :decimal, precision: 15, scale: 8, null: false
    add_column :listings, :lon, :decimal, precision: 15, scale: 8, null: false
  end
end
