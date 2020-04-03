class AddRatingColumnToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :decimal, precision: 3, scale: 1, null: false
    add_column :reviews, :comments, :text
    add_column :reviews, :customer_id, :integer, null: false
    add_column :reviews, :listing_id, :integer, null: false
  end
end
