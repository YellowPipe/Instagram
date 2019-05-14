class ProfileDescription < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { maximum: 1000 }
  validates :name, presence: true, length: { maximum: 30 }
end
