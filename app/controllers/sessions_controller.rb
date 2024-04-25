class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      reset_session # Helps defend the system against SESSION FIXATION ATTACKS
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid Email/Password Combination'
      # Creat an error message.
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy

  end
end
