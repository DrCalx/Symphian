class UpdatesController < ApplicationController
  before_action :ensure_correct_user, only: [:create]
  
  def create
    @update = Group.find(params[:group_id]).updates.build(update_params)
    @update.user = current_user
    if @update.save
      flash[:success] = "Update created"
    else
      flash[:error] = "Update failed"
    end
    redirect_to group_path(params[:group_id])
  end
  
  private
    def update_params
      params.require(:update).permit(:group_id, :user_id, :body)
    end
    
    def ensure_correct_user 
      unless current_user.groups.find_by(id: params[:group_id])
        flash[:danger] = "You must be a member to post an update"
        redirect_to group_path(params[:group_id])
      end
    end
end
