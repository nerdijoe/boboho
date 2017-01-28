class SessionsController < ApplicationController
  def new
    # redirect_to
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'User has been successfully logged in.'
    else
      flash[:alert] = 'Wrong email or password. Please try again.'
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'User has been logged out successfully.'

  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)

    # byebug

    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "User is signed in via Facebook login"
      # byebug
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # @next = edit_user_path(user)
      @next = root_url
      @notice = "User is login via Facebook for the first time, user account is created"
      # byebug
    end

    sign_in(user)

    redirect_to @next, :notice => @notice
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

end
