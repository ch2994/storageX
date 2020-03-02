class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "username"
      t.string   "userid"
      t.string   "password"
    end
  end
end


