class FixColumnsRequiredInCustomers < ActiveRecord::Migration
  def change
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name, false
    change_column_null :customers, :email, false
    change_column_null :customers, :phone, false
    change_column_null :customers, :username, false
    change_column_null :customers, :password, false
  end
end
