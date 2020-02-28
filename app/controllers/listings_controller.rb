class ListingsController < ApplicationController

  def index
    debugger
    zipcode = params[:listing].zipcode
    if zipcode.nil?
      @all_listings = Listing.all
    else
      @all_listings = Listing.where(:zipcode == zipcode)
    end
  end

end
