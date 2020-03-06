require 'SecureRandom'

class ListingsController < ApplicationController
  def listing_params
    params_new = params.require(:listing).permit(Listing::sym2name.keys)
    params_new[:customer_id] = session['customer_id']
    params_new
  end

  def index
    if params[:condition].nil?
      conditions = session[:conditions] = Listing.standardize_conditions(session[:conditions])
    else
      conditions = Listing.standardize_conditions(params[:condition])
    end
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

  def new
    if not session.keys.include?"customer_id" or Customer.where(id: session[:customer_id]).empty?
      flash[:notice] = "Please sign in before posting a new listing, thanks."
      redirect_to login_path
    end
  end

end
