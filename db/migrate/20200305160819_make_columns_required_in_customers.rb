class MakeColumnsRequiredInCustomers < ActiveRecord::Migration
  def change
    change_column_null :customers, :first_name, true
    change_column_null :customers, :last_name, true
    change_column_null :customers, :email, true
    change_column_null :customers, :phone, true
    change_column_null :customers, :username, true
    change_column_null :customers, :password, true
  end
end
