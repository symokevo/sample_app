class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      # Log the user in and redirect to the user's show page.
      reset_session # Helps defend the system against SESSION FIXATION ATTACKS
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) # checks whether the user opts to be remembered at login.
      remember user
      log_in user
      redirect_to forwarding_url || user
    else
      flash.now[:danger] = 'Invalid Email/Password Combination'
      # Creat an error message.
      render 'new', status: :unprocessable_entity
    end
  end

  # def create
  #   @user = User.find_by(email: params[:session][:email].downcase)
  #   if @user && @user.authenticate(params[:session][:password])
  #     reset_session # Helps defend the system against SESSION FIXATION ATTACKS
  #     params[:session][:remember_me] = '1' ? remember(@user) : forget(@user)
  #     log_in @user
  #     redirect_to @user
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new', status: :unprocessable_entity
  #   end
  # end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end
