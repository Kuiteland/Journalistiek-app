class Contact < ActiveRecord::Base
	belongs_to :subject
	validates :name, presence: true, length: { maximum: 50 }
	validates :subject_id, presence: true
end
