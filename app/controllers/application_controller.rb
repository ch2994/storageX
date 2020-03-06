class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_customer
  def current_customer
    if session[:customer_id] and not Customer.where(id: session[:customer_id]).empty?
      @current_customer ||= Customer.find(session[:customer_id])
    else
      @current_customer = nil
    end
  end
end
