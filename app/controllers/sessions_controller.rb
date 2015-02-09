class SessionsController < ApplicationController
	def new
	end

	def create
		if params[:provider] #Use external auth (facebook, google, etc.)
			user = User.from_omniauth(env["omniauth.auth"])
			sign_in user
			redirect_to user
		else
			user = User.find_by(email: params[:session][:email].downcase)
			if user && user.auth_symphian.authenticate(params[:session][:password])
				sign_in user
				remember user
				redirect_to user
			else
				flash.now[:danger] = 'Incorrect username / password'
				render 'new'
			end
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
