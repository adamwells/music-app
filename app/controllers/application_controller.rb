class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user ? @current_user : nil
  end

  def logged_in?
    !current_user.nil?
  end

  def login!(user)
    session[:session_token] = user.session_token
    user
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def verify_logged_in
    unless logged_in?
      flash[:notice] = "You must be logged in to do that!"
      redirect_to new_session_url
    end
  end
end
