class PagesController < ApplicationController
  before_action :two_factor_authenticate, only: [:home]
  
  def home
   
  end
    
  def user_has_2fa
    if current_user
      if !current_user.otp_required_for_login
        redirect_to users_setup_2fa_path
      end
    end
  end
  
end
