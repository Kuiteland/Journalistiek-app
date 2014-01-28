class Subject < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :short_description, presence: true, length: { maximum: 50}
end
