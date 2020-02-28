class ListingsController < ApplicationController

  def index
    zipcode = params[:zipcode]
    if zipcode.nil?
      @all_listings = Listing.all
    else
      @all_listings = Listing.where(:zipcode == zipcode)
    end
  end

end
