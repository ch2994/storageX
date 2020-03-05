class AddForeignkeyToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :customer, foreign_key: true
  end
end
