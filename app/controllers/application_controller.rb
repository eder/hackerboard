class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?
  self.responder = ApplicationResponder

  private
  def self.require_logged_user(options = {})
    before_filter options do
      redirect_to login_path, :alert => t("flash.require_login") unless logged_in?
    end
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    # @current_user ||= session[:user_id] && User.find(session[:user_id])
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
