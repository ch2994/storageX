class RemoveImagesFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :images, :string
  end
end
