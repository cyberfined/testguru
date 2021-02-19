class ApplicationController < ActionController::Base
  def set_session_user_and_redirect(user)
    session[:user_id] = user.id
    url = cookies[:redirect_after_signin] || tests_path
    cookies.delete :redirect_after_signin
    redirect_to url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  private

  def authenticate_user!
    unless logged_in?
      cookies[:redirect_after_signin] = request.path
      redirect_to signin_path
    end
  end
end
