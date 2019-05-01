class Post < ApplicationRecord
	validates_presence_of :image, :user_id
	belongs_to :user
end
