class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Account created. Please log in now."
    else
      flash[:alert] = 'Error creating account: '
      render new_user_path
    end

  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :phone, :address, :city, :country, :zipcode, :profile_pic, :password, :password_confirmation)
  end

end
