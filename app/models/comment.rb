class Comment < ApplicationRecord
	belongs_to :user
	validates :body, presence: true
	validates_presence_of :user
	has_many_attached :files
end
