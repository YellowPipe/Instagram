module PostsHelper
	def delete_button
	    if policy(@post).destroy?
	    	 button_to 'Delete Post', @post, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
	    end
	end

	def edit_button
		if policy(@post).edit?
	    	button_to 'Edit Post', edit_post_path(@post), method: :get, class: 'btn btn-warning'
	    end
	end

	def delete_comment  comment
		if policy(comment).destroy?
	    	link_to 'X', comment, method: :delete, data: { confirm: 'Are you sure?' }, class: 'text-danger float-right'
	    end
	end
end
