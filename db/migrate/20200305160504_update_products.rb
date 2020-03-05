class UpdateProducts < ActiveRecord::Migration
  def change
    remove_column :customers, :user_name, :string
    remove_column :customers, :user_password, :string
    add_column :customers, :username, :string
    add_column :customers, :password, :string
  end
end
