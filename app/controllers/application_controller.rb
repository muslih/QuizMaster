class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper
  private
  
  def logged_in?
    !current_user.nil?
  end

	def teacher?
		logged_in?.email
	end

	def login_only!
		redirect_to signin_path unless logged_in?
	end

	def admin_only!
		redirect_to root_path unless email?
	end

	def login_check!
		redirect_to root_path if logged_in?
	end 
	
end
