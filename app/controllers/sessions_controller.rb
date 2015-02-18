class SessionsController < ApplicationController
	def new
	end

# BIG TODO!!! Refactor most of this crap into an 'auth_controller' 
# 	seperate auth concerns from session concerns

	def create
		case params[:provider]
		when "google_oauth2"
			@auth = env["omniauth.auth"]["credentials"]
			current_user.google_creds(@auth)
			redirect_to current_user
		
		when "facebook" #Use external auth (facebook, google, etc.)
			user = User.from_omniauth(env["omniauth.auth"])
			sign_in user
			remember user
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
	
	def google_params
		params.require(:omniauth.auth).permit(credentials: [:token, :refresh_token, :expires_at, :expires])
	end
end
