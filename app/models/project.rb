class Project < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :sections, dependent: :delete_all
	validates :title, presence: true
	validates :description, presence: true
	# has_rich_text :description
	# validates :users, presence: true
end
