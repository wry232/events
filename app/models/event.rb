class Event < ActiveRecord::Base
  		belongs_to :user
  		has_many :attendings
	    has_many :users_attendings, through: :attendings, source: :user
	    has_many :comments
	    validates :name, :location, :state, :date,  presence:true

	   	# before_create :check_date

	   	# def check_date
	   	# 	if self.date < Date.today
	   	# 		return false
	   	# 	end
	   	# end

end
