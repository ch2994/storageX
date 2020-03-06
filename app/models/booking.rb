class Booking < ActiveRecord::Base
  belongs_to :listing

  def self.time_checking(booking)
    if booking["start_date"] > booking["end_date"]
      return false
    end
    unless DateTime.valid_date? booking["start_date"].year, booking["start_date"].month, booking["start_date"].day
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
end
