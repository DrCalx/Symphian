class GroupsController < ApplicationController
	def show
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		@group.update_attributes(group_params)
		redirect_to @group
	end

	private

	def group_params
		params.require(:group).permit(:bio, :zip, :member_ids => [], :genre_ids => [])
	end
end
