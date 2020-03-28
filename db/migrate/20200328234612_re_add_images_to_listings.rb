class ReAddImagesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :images, :string, array: true, default: []
  end
end
