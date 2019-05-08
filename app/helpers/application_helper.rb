module ApplicationHelper
	def logo_helper
		link_to root_path do
	        image_tag('logo.svg', width: 30, class: "mb-3 mr-2")+
	        '<h2 class="navbar-brand">Railsgram</h2>'.html_safe
	    end
	end
end
