module ApplicationHelper
	def full_title(sub_title)
		base_title = "Symphian"
		if sub_title.empty?
			base_title
		else
			base_title + " | " + sub_title
		end
	end

	def page_id
		if id = content_for(:body_id) and id.present?
			#return id
			return "ladders"
		else
			base = controller.class.to_s.gsub("Controller", '').underscore.gsub("/",'_')
			return "#{base}-#{controller.action_name}"
		end
	end

	def page_class
		#controller.class.to_s.gsub("Controller", '').underscore.gsub("/",'_')+" "+content_for(:page_class)
		return "butz"
	end

	def current_user
		@current_user
	end

	def logged_in?
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		!!current_user
	end
end
