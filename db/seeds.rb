# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{userid: '000001',username: 'nymei', password: '123456'} ])

listings = [{:storage_id => 'sx101', :address => '155 W 68th St', :zipcode => '10023', :daily_price => 20, :email => 'abc@columbia.edu'},
            {:storage_id => 'sx102', :address => '240 Park Ave S', :zipcode => '10003', :daily_price => 30, :email => 'def@columbia.edu'},
            {:storage_id => 'sx103', :address => '10 Hanover Sq', :zipcode => '10005', :daily_price => 40, :email => 'hij@columbia.edu'}
]

listings.each do |listing|
  Listing.create!(listing)
end

