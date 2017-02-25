class UsersController < ApplicationController
	 def new
 	 end

 	def edit
 		@user = User.find_by_id(params[:id])
 	end

 	def create

		@user = User.new user_params
	   if @user.save
	   		session[:user_id] = @user.id
	   		redirect_to "/events"
	   else
	     flash[:error] = @user.errors.full_messages
	     redirect_to "/"
		end
   	end

   	def update
   		@user = User.find(params[:id])
	    if @user.update(user_params)
		      flash[:success] = "User successfully updated"
		      redirect_to "/events"
	    else
	      	flash[:errors] = @user.errors.full_messages
   			redirect_to "/events"
   		end
   	end

   	private
   	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :location, :state)
	end
end