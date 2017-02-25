class EventsController < ApplicationController
	
	def index
		@user = User.find_by_id(session[:user_id])
		@all_users = User.all
		@events = Event.where(state:current_user.state)
		@other_events = Event.where.not(state:current_user.state)
	end


	def create
		puts "****"
		puts params[:event][:date]
		puts "****"
		puts Date.today
		if params[:event][:date] < Time.now
			flash[:date_error] = "Dates can be only selected from current day"
	   		return redirect_to "/events"
	   	end
		@event = Event.create event_params
		if @event.save
			redirect_to "/events"
	   else
	     	flash[:event_error] = @event.errors.full_messages
	     	redirect_to "/events"
		end
	end
	def destroy
	    event = Event.find(params[:id])
	    event.destroy if event.user == current_user
	    redirect_to "/events"
  	end

  	def show
  		@user = User.find_by_id(session[:user_id])
  		@event = Event.find_by_id(params[:id])
  	end


	private

	def event_params
		params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
	end
end
