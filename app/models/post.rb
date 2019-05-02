class Post < ApplicationRecord
	validates_presence_of :image, :user_id
	belongs_to :user

	mount_uploader :image, InstagramUploader
end
