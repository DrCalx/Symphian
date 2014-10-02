class ListingsController < ApplicationController
	def create
		@listing = current_user.listings.build(listing_params)
		if @listing.save
			flash[:success] = "New listing created!"
			redirect_to current_user
		else
			flash[:error] = "Couldn't create listing."
		end
	end

	def update
	end

	def distroy
	end

	private
	def listing_params
		params.require(:listing).permit(:title, :description, :user_id, :listing_type)
	end
end
