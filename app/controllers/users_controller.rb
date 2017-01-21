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

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    byebug
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

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :phone, :address, :city, :country, :zipcode, :profile_pic, :password, :password_confirmation)
  end

end
