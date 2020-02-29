class ListingsController < ApplicationController

  def index
    conditions = params[:listing].nil??session[:conditions]:params[:listing]
    sorted_col = params[:sorted_col].nil??session[:sorted_col]:params[:sorted_col]
    @all_listings = Listing.user_filter(conditions, sorted_col)
    session[:sorted_col] = sorted_col
    session[:conditions] = conditions
  end

end
