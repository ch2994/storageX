require 'spec_helper'

describe Booking do
  it "checks invalid start and end date" do
    booking_params = {:start_date => '2020-03-02', :end_date => '2020-03-01', :listing_id => 1, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking1 = Booking.new(booking_params)
    expect(@booking1[:start_date]).to eq('2020-03-02')
    expect(Booking.time_checking(@booking1)).to be_falsey
  end



end