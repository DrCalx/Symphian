class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user
			render 'new'
		else
			flash[:error] = 'Sorry, try again'
			render 'new'
		end
	end

	def destroy
	end
end
