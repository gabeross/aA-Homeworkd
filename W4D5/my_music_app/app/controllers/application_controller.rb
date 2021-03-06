class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    return true unless current_user.nil?

    false
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

end
