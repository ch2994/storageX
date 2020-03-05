class ChangeCustomersPassword < ActiveRecord::Migration
  def change
    remove_column :customers, :password, :string
    add_column :customers, :password, :digest, :null => false
  end
end
