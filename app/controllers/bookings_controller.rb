class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :show_review]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(:customer_id => session['customer_id'])
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

  end

  # GET /bookings/new
  def new
    if not session.keys.include?"customer_id" or Customer.where(id: session[:customer_id]).empty?
      flash[:notice] = "Please sign in before booking a listing, thanks."
      redirect_to login_path
    end
    listing_id = params[:listing_id]
    @listing = Listing.find(listing_id)
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
    @listing = Listing.find(@booking.listing_id)
  end

  # POST /bookings
  # POST /bookings.json
  def create
    # puts params
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if Booking.validate(booking_params) and Booking.time_checking(@booking) and @booking.save
        # if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.'}
        format.json { render :index, status: :created, location: @booking }
      else
        # @listing_id = @booking.listing_id
        format.html { redirect_to  bookings_new_path(:listing_id => @booking.listing_id)}
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        flash[:notice] = "The date is invalid or is booked."
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @temp = set_booking

    @temp[:start_date] = DateTime.new(booking_params["start_date(1i)"].to_i,
                                      booking_params["start_date(2i)"].to_i,
                                      booking_params["start_date(3i)"].to_i)
    @temp[:end_date] = DateTime.new(booking_params["end_date(1i)"].to_i,
                                      booking_params["end_date(2i)"].to_i,
                                      booking_params["end_date(3i)"].to_i)
    @temp[:updated_at] = DateTime.now
    respond_to do |format|
      if cur_customer_id != @temp.customer_id：
        # Prevent illegal update others' listings
        format.html { redirect_to listings_index_path, notice: 'Unauthorized Edit Operation was banned.' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      elsif Booking.validate(booking_params) and Booking.time_checking(@temp) and @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_review
    @all_reviews = Review.where(:customer_id => session[:customer_id])
    id = params[:id]
    @listing = Listing.find(id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def cur_customer_id
      return session['customer_id']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params_new = params.require(:booking).permit(:start_date, :end_date)
      params_new[:listing_id] = params[:listing_id].to_i
      if params_new[:listing_id] == 0
          params_new[:listing_id] = Booking.find(params[:id]).listing_id
      end
      params_new[:customer_id] = session[:customer_id]
      return params_new
    end
end
