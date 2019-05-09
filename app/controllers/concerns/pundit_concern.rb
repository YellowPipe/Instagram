module PunditConcern
	extend ActiveSupport::Concern
	
	private

	def user_not_authorized
	  flash[:error] = "You are not authorized to perform this action."
	  redirect_to(request.referrer || root_path)
	end

end