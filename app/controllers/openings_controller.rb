class OpeningsController < ApplicationController
	def create
		@openings = Opening.new(opening_params)
		if @openings.save
			flash[:success] = "Opening Posted"
			redirect_to group_path(params[:opening][:group_id])
		else
			render group_path(params[:opening][:group_id])
		end
	end

	def destroy
		opening = Opening.find(params[:id])
		group = opening.group
		opening.destroy
		flash[:success] = "Destroyed Opening"
		redirect_to group
	end

	private
	def opening_params
		params.require(:opening).permit(:zip, :instrument_id, :description, :group_id)
	end
end