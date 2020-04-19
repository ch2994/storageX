class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by_email(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash[:notice] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_url, notice: 'Logged out!'
  end
end
