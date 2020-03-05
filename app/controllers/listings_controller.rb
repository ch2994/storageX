require 'SecureRandom'

class ListingsController < ApplicationController
  def listing_params
    params.require(:listing).permit(Listing::sym2name.keys)
  end

  def index
    conditions = params[:listing].nil??session[:conditions]:params[:listing]
    sorted_col = params[:sorted_col].nil??session[:sorted_col]:params[:sorted_col]
    @all_listings = Listing.user_filter(conditions, sorted_col)
    session[:sorted_col] = sorted_col
    session[:conditions] = conditions
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @listing = Listing.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def create
    @listing = Listing.new(listing_params)
    time_now = Time.now.getutc
    @listing.created_at = time_now
    @listing.updated_at = time_now
    flash[:notice] = if @listing.save
                       'New listing added successfully!'
                     else
                       'Failed to Add New listing'
                     end
    redirect_to action: "index"
  end

end
