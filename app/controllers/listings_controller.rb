class ListingsController < ApplicationController
	def create
		@listing = Listing.new(listing_params)
		if true
			flash[:success] = "New listing created!"
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
		params.require(:listing).permit(:title, :description)
	end
end
