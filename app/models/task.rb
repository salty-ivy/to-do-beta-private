class Task < ApplicationRecord
	belongs_to :section
	belongs_to :user, optional: true

	validates :title, presence: true

	validates_presence_of :section
end
