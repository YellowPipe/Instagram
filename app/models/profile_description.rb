class ProfileDescription < ApplicationRecord
  belongs_to :user
  validates :body, length: { minimum: 5, maximum: 1000 }
  validates :name, length: { maximum: 30 }
end
