class UsersController < ApplicationController
	
	before_action :ensure_signed_in, only: [:update]
	
	def show
		@user = User.find(params[:id])
		@instruments = @user.instruments
		@quack = @user.instruments.collect { |instrument| instrument.id }
		@listings = @user.listings
		@youtube = @user.youtube ||= Youtube.new
		@listing = Listing.new
	end

	def index
		@users = User.all
	end

	def new
		@user = User.new
		@user.build_auth_symphian
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Symphian!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "user terminated"
		redirect_to dash_url
	end

	private 
		def user_params
			#params is passed in via the form. We need to insure only the correct hash values are present
			params.require(:user).permit(:name, :email, :zip, :bio, :instrument_ids => [], :genre_ids => [], auth_symphian_attributes: [:password, :password_confirmation])
		end
end