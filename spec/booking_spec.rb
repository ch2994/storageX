require 'spec_helper'

describe Booking do

  it "checks invalid date format case 1" do
    booking_params1 = {"start_date(1i)"=> 2020, "start_date(2i)"=> 3, "start_date(3i)"=> 1,
                       "end_date(1i)"=> 2020, "end_date(2i)"=> 3, "end_date(3i)"=> 2}
    expect(Booking.validate(booking_params1)).to be_truthy

  end

  it "checks invalid date format case 2" do
    booking_params2 = {"start_date(1i)"=> 2020, "start_date(2i)"=> 2, "start_date(3i)"=> 31,
                       "end_date(1i)"=> 2020, "end_date(2i)"=> 3, "end_date(3i)"=> 2}
    expect(Booking.validate(booking_params2)).to be_falsey
  end

  it "checks invalid date format case 2" do
    booking_params3 = {"start_date(1i)"=> 2020, "start_date(2i)"=> 3, "start_date(3i)"=> 1,
                       "end_date(1i)"=> 2020, "end_date(2i)"=> 3, "end_date(3i)"=> 33}
    expect(Booking.validate(booking_params3)).to be_falsey
  end

  it "checks end date not earlier than start date case 1" do
    booking_params1 = {:start_date => '2020-03-02', :end_date => '2020-03-01', :listing_id => 1, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking1 = Booking.new(booking_params1)
    expect(Booking.time_checking(@booking1)).to be_falsey
  end

  it "checks end date not earlier than start date case 2" do
    booking_params2 = {:start_date => '2020-03-06', :end_date => '2020-03-07', :listing_id => 1, :created_at => '2020-03-02',
                       :updated_at => '2020-03-02', :customer_id=> 1}
    @booking2 = Booking.new(booking_params2)
    expect(Booking.time_checking(@booking2)).to be_truthy
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 1" do
    booking_params = {:start_date => '2020-03-05', :end_date => '2020-03-06', :listing_id => 1, :created_at => '2020-03-02',
                       :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_truthy
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 2" do
    booking_params = {:start_date => '2020-02-01', :end_date => '2020-03-06', :listing_id => 1, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_falsey
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 3" do
    booking_params = {:start_date => '2020-02-06', :end_date => '2020-03-06', :listing_id => 2, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_truthy
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 4" do
    booking_params = {:start_date => '2020-02-03', :end_date => '2020-02-06', :listing_id => 2, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_falsey
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 5" do
    booking_params = {:start_date => '2020-02-08', :end_date => '2020-03-06', :listing_id => 3, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_truthy
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 6" do
    booking_params = {:start_date => '2020-02-05', :end_date => '2020-02-06', :listing_id => 3, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_falsey
  end

  it "checks for two bookings on a same id, the latter should not start earlier than the previous case 7" do
    booking_params = {:start_date => '2020-02-05', :end_date => '2020-02-06', :listing_id => 1, :created_at => '2020-03-02',
                      :updated_at => '2020-03-02', :customer_id=> 1}
    @booking = Booking.new(booking_params)
    expect(Booking.time_checking(@booking)).to be_truthy
  end
end