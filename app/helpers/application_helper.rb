module ApplicationHelper
	def nav_class(action, match_to = :action)
		'active' if action == params[match_to]
	end
end
