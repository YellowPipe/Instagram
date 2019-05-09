class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include Pundit
	include PunditConcern
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	before_action :authenticate_user!
end
