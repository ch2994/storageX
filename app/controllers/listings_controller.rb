require 'SecureRandom'

class ListingsController < ApplicationController
  def listing_params
    params.require(:listing).permit(:storage_id, :address, :zipcode, :daily_price, :email)
  end

  def index
    zipcode = params[:zipcode]
    if zipcode.nil?
      @all_listings = Listing.all
    else
      @all_listings = Listing.where(:zipcode == zipcode)
    end
  end

  def create
    @listing = Listing.create!(listing_params)
    #flash[:notice] = "#{@listings.storage} was successfully created."
    redirect_to listing_path
  end

end
