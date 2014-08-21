class GroupsController < ApplicationController
	def show
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		@group.add_member!(params[:group][:members])
		redirect_to @group
	end
end
