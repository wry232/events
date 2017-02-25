class User < ActiveRecord::Base
	has_secure_password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	  validates :first_name, :last_name, :email, :location, :state, presence:true
	  validates :email, :uniqueness => true, :format => { :with => email_regex },
	   :uniqueness => { :case_sensitive => false }
	   validates :password, presence: true, :on => :create, length: { in: 6..20 }
	   has_many :events, dependent: :destroy
	   has_many :attendings
	   has_many :events_attendings, through: :attendings, source: :event
	   has_many :comments, dependent: :destroy
end
