listings = [{:storage_id => 'sx101', :address => '155 W 68th St', :zipcode => '10023', :daily_price => 20, :email => 'abc@columbia.edu'},
            {:storage_id => 'sx102', :address => '240 Park Ave S', :zipcode => '10003', :daily_price => 30, :email => 'def@columbia.edu'},
            {:storage_id => 'sx103', :address => '10 Hanover Sq', :zipcode => '10005', :daily_price => 40, :email => 'hij@columbia.edu'}
]

listings.each do |listing|
  Listing.create!(listing)
end