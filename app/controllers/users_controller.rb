class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    # implement pagination
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session # prevent Session-fixation attacks
      log_in @user
      # Handle a successful save
      flash[:success] = "Welcome! Account registered successfully"
      redirect_to @user
    else
      # return status code 422
      render 'new', status: :unprocessable_entity
    end
  end

  # Enable profile editing
  def edit
    # @user = User.find(params[:id])
  end

  # Updating user profiles
  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  # Deleting users
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url, status: :see_other
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Before filters
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url, status: :see_other
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, status: :see_other) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url, status: :see_other) unless current_user.admin?
  end
end
