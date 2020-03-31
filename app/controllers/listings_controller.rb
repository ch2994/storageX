require 'securerandom'

class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :show_review]

  def index
    if params[:condition].nil?
      conditions = session[:conditions] = Listing.standardize_conditions(session[:conditions])
    else
      conditions = Listing.standardize_conditions(params[:condition])
    end
    sorted_col = params[:sorted_col].nil??session[:sorted_col]:params[:sorted_col]
    search_query = params['queryTbx']
    gon.azure_map_key = Listing.azure_map_key
    @all_listings = Listing.user_filter(conditions, sorted_col, search_query)
    flash[:search_query] = search_query
    session[:sorted_col] = sorted_col
    session[:conditions] = conditions

    @listings = Listing.where(:customer_id => session['customer_id'])
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
    else
      @listing = Listing.new
    end
  end

  def edit
    @listing = set_listing
  end

  def update
    @temp = set_listing
    listing_params[:updated_at] = DateTime.now
    respond_to do |format|
      if Listing.validate(listing_params) and @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
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

  def listing_params
    params_new = params.require(:listing).permit(Listing::sym2name.except(:images).keys, {images: []})
    params_new[:id] = params[:id]
    params_new[:customer_id] = session['customer_id']
    return params_new
  end
end
