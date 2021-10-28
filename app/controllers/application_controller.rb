class ApplicationController < ActionController::Base
  before_action :get_username

    def after_sign_in_path_for(resource)
        home_landing_path
    end
    def get_username
      if current_user != nil
      email = current_user.email
      username, domain = email.split('@')
      @username = username
      end
    end  
end
