class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper ApplicationHelper
  helper_method [:current_user, :logged_in?, :is_owner?]

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def is_real_user?(user_id)
    return true if current_user.id == user_id.to_i
    false
  end

  def auth_users(user_id)
    redirect_to '/login', alert: "Access denied, please logout and sign in to this user account if you want to make modification ." unless is_real_user?(user_id)
  end

  def is_owner?(listing_id)
    return true if current_user.id == Listing.find(listing_id).user_id
    false
  end

  def auth_listings(listing_id)
    redirect_to root_path, alert: 'Access Denied' if !is_owner?(listing_id)
  end

  def authorize
     redirect_to '/login', alert: 'You must login to access that page.' unless current_user
  end

  def auth_destroy
    redirect_to root_path, alert: "You don't have access to do this" unless current_user.superadmin?
  end

  def authenticate!
    redirect_to '/login' and return unless logged_in?
  end

end
