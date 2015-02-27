class GroupsController < ApplicationController
	def new
		@group = Group.new
	end
	
	def create
		@group = Group.new(group_params)
		@group.members << current_user
		if @group.save
			flash[:success] = "Your group has been created."
			redirect_to @group
		else
			flash[:error] = "Couldn't create group"
			render 'new'
		end
	end
	
	def show
		@group = Group.find(params[:id])
		@opening = @group.openings.build
	end

	def index
		@groups = Group.all
	end

	def update
		@group = Group.find(params[:id])
		@group.update_attributes(group_params)
		redirect_to @group
	end
	
	def destroy
		Group.find(params[:id]).destroy
		flash[:success] = "Group Destroyed"
		redirect_to request.referrer
	end

	private

	def group_params
		params.require(:group).permit(	:name, :bio, 
			:zip,
			:member_ids => [], 
			:genre_ids => [], 
			openings_attributes: [:instrument_id, :description])
	end
end
