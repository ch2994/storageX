class CreateCustomers < ActiveRecord::Migration
  def change
    drop_table :customers
    create_table :customers do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end


