module GroupsHelper
	def manager?(user)
		#add manager column to membership 
		return true
	end

	def setup_opening(group)
		group.openings << Opening.new
		return group
	end
end
