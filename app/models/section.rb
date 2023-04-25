class Section < ApplicationRecord
	belongs_to :project
	has_many :tasks, dependent: :delete_all

	validates :name, presence: true
	validates_presence_of :project
end
