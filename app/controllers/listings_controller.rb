require 'SecureRandom'

class ListingsController < ApplicationController
  def listing_params
    params.require(:listing).permit(:storage_id, :address, :zipcode, :daily_price, :email)
  end

  def index
    listing = params[:listing]
    @all_listings = if listing.nil?
                      Listing.all
                    else
                      Listing.where(:zipcode == listing.zipcode)
                    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @listing = Listing.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def create
    @listing = Listing.new(listing_params)
    flash[:notice] = if @listing.save
                       'New listing added successfully!'
                     else
                       'Failed to Add New listing'
                     end
    redirect_to action: "index"
  end

end
