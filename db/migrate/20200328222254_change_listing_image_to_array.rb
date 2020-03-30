class ChangeListingImageToArray < ActiveRecord::Migration
  def change
    change_column :listings, :images, "character USING images::character varying[]" ##:string,  array: true, default: []  # add images column as array
  end
end
