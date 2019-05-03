class Post < ApplicationRecord
	validates_presence_of :image, :user_id, :description
	belongs_to :user

	mount_uploader :image, InstagramUploader

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
end
