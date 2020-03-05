class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :user_name
      t.string :user_password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
