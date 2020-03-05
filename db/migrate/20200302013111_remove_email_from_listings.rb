class RemoveEmailFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :email, :string
  end
end
