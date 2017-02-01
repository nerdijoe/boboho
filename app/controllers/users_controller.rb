class UsersController < ApplicationController
  before_action only: [:edit, :update, :destroy] do
    auth_users(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "superadmin" if @user.email == "super@admin.com"

    if @user.save
      redirect_to root_path, notice: "Account created. Please log in now."
    else
      flash[:alert] = 'Error creating account: '
      render new_user_path
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: 'You have successfuly saved your changes.'
    else
      flash[:alert] = 'Cannot save your changes.'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:user_id]).destroy
    session[:user_id] = nil
    flash[:alert] = "User account is deleted"
    redirect_to root_path
  end


  def edit_profile_pic
    @user = User.find(session[:user_id])
  end

  def chat
    @user = User.find(params[:user_id])
    # @listing = Listing.find(params[:listing_id])
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :phone, :address, :city, :country, :zipcode, :profile_pic, :password, :password_confirmation)
  end

end
