class RemoveStorageIdFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :storage_id, :string
  end
end
