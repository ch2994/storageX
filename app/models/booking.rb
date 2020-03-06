class Booking < ActiveRecord::Base
  belongs_to :listing

  def self.time_checking(booking)
    if booking["start_date"] > booking["end_date"]
      return false
    end
    current = Booking.where(customer_id: booking["customer_id"])
    for each in current
      if each["end_date"] > booking["start_date"]
        return false
      end
    end
    return true
  end

  def self.validate(booking_params)
    unless DateTime.valid_date? booking_params["start_date(1i)"].to_i, booking_params["start_date(2i)"].to_i, booking_params["start_date(3i)"].to_i
      return false
    end
    unless DateTime.valid_date? booking_params["end_date(1i)"].to_i, booking_params["end_date(2i)"].to_i, booking_params["end_date(3i)"].to_i
      return false
    end
    return true
  end
end
