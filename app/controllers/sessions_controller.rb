class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    # If user exists, and pw entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # save user id inside the browser cookie. this keeps user logged in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if incorrect, we go back to the form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  end