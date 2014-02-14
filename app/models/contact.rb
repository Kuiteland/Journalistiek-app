class Contact < ActiveRecord::Base
	belongs_to :subject
	validates :name, presence: true, length: { maximum: 50 }
	validates :subject_id, presence: true

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
