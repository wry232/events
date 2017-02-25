class AttendingsController < ApplicationController
	def create
		event = Event.find(params['event_id'])
    	attending = Attending.create(user: current_user, event: event)
    	redirect_to "/events"
	end
	def destroy
    	attending = Attending.find(params[:id]).destroy
    	redirect_to "/events"
  	end
end
