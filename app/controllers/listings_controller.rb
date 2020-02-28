class ListingsController < ApplicationController

  def index
    listing = params[:listing]
    if listing.nil?
      @all_listings = Listing.all
    else
      @all_listings = Listing.where(:zipcode == listing.zipcode)
    end
  end

end
