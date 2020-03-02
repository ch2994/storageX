class UserListings < ActiveRecord::Migration
  def change
    create_table :userlistings do |t|
      t.string  "userid"
      t.string  "username"
      t.string  "password"
    end
  end
end