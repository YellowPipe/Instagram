module UserHelper
	def gravatar_for(user, size: 150)
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	    image_tag(gravatar_url, alt: 'avatar', class: "rounded-circle img-fluid")
  	end

  	def profile_description_button
	  	if @user.profile_description.nil? && @user == current_user
	       link_to 'Tell people about yourself', new_profile_description_path, class: "btn btn-outline-secondary mt-2"
	    end
	end

end
