class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@instruments = @user.instruments
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome"
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
	end

	def settings
	end

	private 
		def user_params
			#params is passed in via the form. We need to insure only the correct hash values are present
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, instrument_ids: [])
		end
end