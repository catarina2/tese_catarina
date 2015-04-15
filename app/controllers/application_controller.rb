class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  helper_method :admin?, :admin
  protected

  def authorize
  	unless admin?
  		flash[:error] = "Unauthorized access"
  		redirect_to welcome_index_path
    end
  end

  def admin?
  	 if user_signed_in?
  		true
  	 else
  	 	false
  	 end
  end
end
