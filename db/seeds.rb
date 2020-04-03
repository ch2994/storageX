# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customers = [{:username => 'niuynmei', :password_digest => 'e1e6984d48ce6c0cd7473c487e6fe33d', :first_name => 'Niuyin', :last_name => 'Mei',
             :email => 'jeff_mei@outlook.com', :phone => '365-187-1798', :created_at => '2020-02-02',
             :updated_at => '2020-03-02'}]

customers.each do |customer|
  Customer.create!(customer)
end

listings = [{:name => 'Manhattan Mini Storage', :zipcode => '10003', :daily_price => 20, :address => '240 Park Ave S',
             :city => 'abc@columbia.edu', :state => 'New York', :size => 30, :lat => 40.73802, :lon => -73.98835, :customer_id => 1},
            {:name => 'Brooklyn Max Storage', :zipcode => '11201', :daily_price => 10, :address => '34 Orange St, Brooklyn',
             :city => 'New York', :state => 'New York', :size => 40, :lat => 40.6991, :lon => -73.99441, :customer_id => 1},
            {:name => 'Jacks Storage', :zipcode => '10023', :daily_price => 40, :address => '132 West 71st Street',
             :city => 'New York', :state => 'New York', :size => 50, :lat => 40.77701, :lon => -73.98061, :customer_id => 1},
            {:name => 'Columbia Storage', :zipcode => '10025', :daily_price => 40, :address => '2955 Broadway',
             :city => 'New York', :state => 'New York', :size => 60, :lat => 40.80793, :lon => -73.96444, :customer_id => 1},
            {:name => 'Store Eric', :zipcode => '10024', :daily_price => 50, :address => '2233 Broadway',
             :city => 'New York', :state => 'New York', :size => 70, :lat => 40.76456, :lon => -73.93039, :customer_id => 1},
            {:name => 'Leave your box', :zipcode => '10025', :daily_price => 20, :address => '135 W 107TH ST',
             :city => 'New York', :state => 'New York', :size => 80, :lat => 40.80065, :lon => -73.96423, :customer_id => 1}
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

