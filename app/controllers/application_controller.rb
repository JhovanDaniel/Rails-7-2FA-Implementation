class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:otp_attempt])
  end
  
  def two_factor_authenticate
    if current_user
      if !current_user.otp_required_for_login
        redirect_to users_setup_2fa_path
      end
    end
    
    authenticate_user!
  end
end
