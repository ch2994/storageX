class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    redirect_to "/listings/index.html.haml"
  end

  def login_attempt
    username = params[:user]["username"]
    password = params[:user]['password']
    # debugger
    current_user = User.find_by_username(username)
    if password == current_user.password
      redirect_to("/listings/index")
    else
      redirect_to("/users/index/" + current_user.password)
    end
    # if authorized_user
    #   flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
    #   redirect_to("listings/incdex.html.haml")
    # end
    # else
    #   flash[:notice] = "Invalid Username or Password"
    #   flash[:color]= "invalid"
    #   render "users"
    # end
  end
end