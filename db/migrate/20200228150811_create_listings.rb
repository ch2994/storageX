class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string   "storage_id"
      t.string   "address"
      t.string   "zipcode"
      t.string   "daily_price"
      t.string   "email"
    end
  end
end