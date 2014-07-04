class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  config.relative_url_root = ""  
  helper_method :current_user, :require_user, :mobile_device?  

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  def require_user
    unless current_user
      flash[:alert]="Morate biti logirani da bi vidjeli podatke"
      redirect_to root_path
    end
  end
end
