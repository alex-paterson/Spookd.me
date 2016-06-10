class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

	def check_admin
		if current_user.admin == false
    		flash[:danger] = "Permission denied."
			redirect_to root_url
		end
	end

	def check_logged_in
		if current_user == nil
    		flash[:danger] = "You must be logged in."
			redirect_to root_url
		end
	end

	def current_user
		begin 
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		rescue			
			session[:user_id] = nil
			return nil
		end
	end
	helper_method :current_user

end
