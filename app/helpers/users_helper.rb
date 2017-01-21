module UsersHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returns true if current_user exists, false otherwise
	def logged_in?
		!current_user.nil?
	end

end
