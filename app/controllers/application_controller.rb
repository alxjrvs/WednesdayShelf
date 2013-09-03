class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

    def secret_key
      params["secret-key-here"].try(:first)
    end

    def valid_session?
      session[:secret_key] == ENV['SECRETKEY']
    end

    def validate_session
      if secret_key
        session[:secret_key] = secret_key
      end
      unless valid_session?
        flash[:notice] = 'Sorry, You don\'t have the right key!'
        redirect_to root_path
      end
    end
end
