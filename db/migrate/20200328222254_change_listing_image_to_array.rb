class ChangeListingImageToArray < ActiveRecord::Migration
  def change
    change_column :listings, :images, :string, array: true, default: [] # add images column as array
  end
end
