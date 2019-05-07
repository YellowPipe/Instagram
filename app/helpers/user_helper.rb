module UserHelper
	def gravatar_for(user)
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=150"
	    image_tag(gravatar_url, alt: 'avatar', class: "rounded-circle img-fluid")
  	end
end
