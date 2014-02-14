class Subject < ActiveRecord::Base
	has_many :contacts
	has_many :tags
	validates :name, presence: true, length: { maximum: 50 }
	validates :short_description, presence: true, length: { maximum: 50}
end
