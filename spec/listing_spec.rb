require 'spec_helper'

describe Listing do
  describe '#filter' do
    before(:each) {
      listings = [{:name => 'Andy', :zipcode => '10023', :daily_price => 20, :address => '240 Park Ave S',
                   :city => 'abc@columbia.edu', :state => 'New York', :size => 30},
                  {:name => 'Bob', :zipcode => '10023', :daily_price => 10, :address => '242 Park Ave S',
                   :city => 'New York', :state => 'New York', :size => 40},
                  {:name => 'Jack', :zipcode => '10023', :daily_price => 40, :address => '244 Park Ave S',
                   :city => 'New York', :state => 'New York', :size => 50},
      ]
      debugger
      listings.each do |listing|
        Listing.create!(listing)
      end
    }
    it "filter all condition" do
      expect(Listing.user_filter()).to eq(3)
    end
  end
end
