module ApplicationHelper
	def nav_class(action)
		'active' if action == params['action']
	end
end
