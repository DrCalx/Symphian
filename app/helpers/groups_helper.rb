module GroupsHelper
	def manager?(user)
		#add manager column to membership 
		return true
	end
	
	def member?(user)
		Group.find(params[:id]).members.find_by(id: user.id)
	end
end
