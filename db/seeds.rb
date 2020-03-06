# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create([{userid: '000001',username: 'nymei', password: '123456'} ])
#
# # listings = [{:storage_id => 'sx101', :address => '155 W 68th St', :zipcode => '10023', :daily_price => 20, :email => 'abc@columbia.edu'},
# #             {:storage_id => 'sx102', :address => '240 Park Ave S', :zipcode => '10003', :daily_price => 30, :email => 'def@columbia.edu'},
# #             {:storage_id => 'sx103', :address => '10 Hanover Sq', :zipcode => '10005', :daily_price => 40, :email => 'hij@columbia.edu'}
# # ]

listings = [{:name => 'Manhattan Mini Storage', :zipcode => '10023', :daily_price => 20, :address => '240 Park Ave S',
             :city => 'abc@columbia.edu', :state => 'New York', :size => 30},
            {:name => 'Brooklyn Max Storage', :zipcode => '10023', :daily_price => 10, :address => '242 Park Ave S',
             :city => 'New York', :state => 'New York', :size => 40},
            {:name => 'Jacks Storage', :zipcode => '10023', :daily_price => 40, :address => '244 Park Ave S',
             :city => 'New York', :state => 'New York', :size => 50},
            {:name => 'Columbia Storage', :zipcode => '10024', :daily_price => 40, :address => '244 Park2 Ave S',
             :city => 'New York', :state => 'New York', :size => 60},
            {:name => 'Store Eric', :zipcode => '10024', :daily_price => 50, :address => '244 Park12 Ave S',
             :city => 'New York', :state => 'New York', :size => 70},
            {:name => 'Leave your box', :zipcode => '10025', :daily_price => 20, :address => '244 Park123 Ave S',
             :city => 'New York', :state => 'New York', :size => 80}
]

listings.each do |listing|
  Listing.create!(listing)
end

bookings = [{:start_date => '2020-02-02', :end_date => '2020-02-04', :listing_id => 1, :created_at => '2020-02-02',
             :updated_at => '2020-03-02', :customer_id=> 1},
            {:start_date => '2020-02-02', :end_date => '2020-02-05', :listing_id => 2, :created_at => '2020-02-02',
             :updated_at => '2020-03-02', :customer_id=> 1},
            {:start_date => '2020-03-02', :end_date => '2020-02-06', :listing_id => 3, :created_at => '2020-02-02',
             :updated_at => '2020-03-02', :customer_id=> 1}]

bookings.each do |booking|
  Booking.create!(booking)
end

