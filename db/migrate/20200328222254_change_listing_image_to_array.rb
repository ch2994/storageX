class ChangeListingImageToArray < ActiveRecord::Migration
  def change
    change_column :listings, :images, "character USING images::character varying[]"
  end
end
