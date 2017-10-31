class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end

  # def validate_user
  #   redirect_to new_session_url if current_user.is_password?(password)
  # end 

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

end
