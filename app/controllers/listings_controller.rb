class ListingsController < ApplicationController
	
	before_action :ensure_signed_in, only: [:create, :destroy]
	before_action :ensure_correct_user, only: [:destroy]
	
	def create
		@listing = current_user.listings.build(listing_params)
		if @listing.save
			flash[:success] = "New listing created!"
		else
			flash[:error] = "Couldn't create listing."
		end
		redirect_to current_user
	end

	def update
	end

	def destroy
	end

	private
	def listing_params
		params.require(:listing).permit(:title, :description, :user_id, :listing_type_id)
	end
	
		def ensure_correct_user
			@micropost = current_user.listings.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end
end
