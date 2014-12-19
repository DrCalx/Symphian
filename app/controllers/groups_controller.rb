class GroupsController < ApplicationController
	def new
		@group = Group.new
	end
	
	def create
		@group = Group.new(group_params)
		if @group.save
			flash[:success] = "Congrats on the new group"
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

	private

	def group_params
		params.require(:group).permit(	:name, :bio, 
			:zip,
			:member_ids => [], 
			:genre_ids => [], 
			openings_attributes: [:instrument_id, :description])
	end
end
