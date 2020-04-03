require 'securerandom'

class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :show_review]

  def index
    conditions = index_condition_extract
    sorted_col = get_sorted_col
    search_query = params['queryTbx']
    gon.azure_map_key = Listing.azure_map_key
    @all_listings = Listing.user_filter(conditions, sorted_col, search_query)
    if not cur_customer_id.nil?
      @all_listings = @all_listings.where("customer_id != #{cur_customer_id}")
    end
    # support map mode display by passing all listings' coordinates to front-end
    gon.listings_coordinates, @avg_ratings = [], []
    @all_listings.each do |one_listing|
      gon.listings_coordinates.append([one_listing.lon,one_listing.lat])
      rating = Review.where(:listing_id => listing['id']).average("rating")
      @avg_ratings.append(rating)
    end
    store_situations_for_index(search_query, sorted_col, conditions)
  end

  def my_listings_index
    conditions = index_condition_extract
    sorted_col = get_sorted_col
    search_query = params['queryTbx']
    gon.azure_map_key = azure_map_key
    @all_listings = Listing.user_filter(conditions, sorted_col, search_query)
    if not cur_customer_id.nil?
      @all_listings = @all_listings.where(:customer_id => cur_customer_id)
    else
      redirect_to login_path
    end
    store_situations_for_index(search_query, sorted_col, conditions)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @listing = Listing.find(id) # look up movie by unique ID
    @all_reviews = Review.where(:listing_id => params[:id])
    # will render app/views/movies/show.<extension> by default
  end

  def create

    @listing = Listing.new(listing_params)
    time_now = Time.now.getutc
    @listing.created_at = time_now
    @listing.updated_at = time_now
    specific_address = [@listing.address, @listing.city, @listing.state, @listing.zipcode].join(', ')
    new_listing_loc, valid_address_flag = Listing.get_long_lat_by_address(specific_address), true
    # check the validity of the input address
    if new_listing_loc.empty?
      valid_address_flag = false
    else
      @listing.lon, @listing.lat = new_listing_loc[:lon.to_s], new_listing_loc[:lat.to_s]
    end
    flash[:notice] = if valid_address_flag and @listing.save
                       'New listing added successfully!'
                     else
                       'Failed to Add New listing, please try again.'
                     end
    redirect_to listings_index_path
  end

  def new
    gon.azure_map_key = azure_map_key
    if not session.keys.include?"customer_id" or Customer.where(id: session[:customer_id]).empty?
      flash[:notice] = "Please sign in before posting a new listing, thanks."
      redirect_to login_path
    else
      @listing = Listing.new
    end
  end

  def edit
    gon.azure_map_key = azure_map_key
    @listing = set_listing
    if cur_customer_id != @listing.customer_id
      redirect_to listings_index_path, notice: 'Unauthorized access to the Edit page of others\' listing.'
    end
  end

  def update
    @temp = set_listing
    listing_params[:updated_at] = DateTime.now
    respond_to do |format|
      updated_listing = listing_params
      specific_address = [updated_listing['address'], updated_listing['city'], updated_listing['state'], updated_listing['zipcode']].join(', ')
      updated_listing = updated_listing.merge(Listing.get_long_lat_by_address(specific_address))
      if cur_customer_id != @temp.customer_id
        # Prevent illegal update others' listings
        format.html { redirect_to listings_index_path, notice: 'Unauthorized Edit Operation was banned.' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      elsif Listing.validate(updated_listing) and @listing.update(updated_listing)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        flash[:notice] = 'Listing Edit operation failed. Please check your location information.'
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  def show_review
    @current_review = Review.find_by_listing_id(params[:id])
  end

  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def cur_customer_id
      return session['customer_id']
    end

    def get_sorted_col
      return params[:sorted_col].nil??session[:sorted_col]:params[:sorted_col]
    end

    def index_condition_extract
      if params[:condition].nil?
        conditions = session[:conditions] = Listing.standardize_conditions(session[:conditions])
      else
        conditions = Listing.standardize_conditions(params[:condition])
      end
      return conditions
    end

    def azure_map_key
      return Listing.azure_map_key
    end

    def store_situations_for_index(search_query=nil, sorted_col=nil, conditions=nil)
      if not search_query.nil?
        gon.map_center = Listing.get_long_lat_by_address(search_query)
        flash[:search_query] = search_query
      end
      session[:sorted_col] = sorted_col
      session[:conditions] = conditions
    end

    def listing_params
      params_new = params.require(:listing).permit(Listing::sym2name.except(:images).keys, {images: []})
      params_new[:id] = params[:id]
      params_new[:customer_id] = cur_customer_id
      return params_new
    end
end
