class AddTimestampsToListing < ActiveRecord::Migration
  def change
    add_column :listings, :created_at, :datetime
    add_column :listings, :updated_at, :datetime
  end
end
