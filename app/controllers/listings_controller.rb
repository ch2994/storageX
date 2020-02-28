require 'SecureRandom'

class ListingsController < ApplicationController
  def listing_params
    params.require(:listing).permit(:storage_id, :address, :zipcode, :daily_price, :email)
  end

  def index
    listing = params[:listing]
    if listing.nil?
      @all_listings = Listing.all
    else
      @all_listings = Listing.where(:zipcode == listing.zipcode)
    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @listing = Listing.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      flash[:notice] = 'New listing added successfully!'
      redirect_to action: "index"
    else
      render 'new'
    end
  end

end
