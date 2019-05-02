class Post < ApplicationRecord
	validates_presence_of :image, :user_id, :description
	belongs_to :user

	mount_uploader :image, InstagramUploader
end
