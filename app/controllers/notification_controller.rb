class NotificationController < ApplicationController
  
  def index
  	current_user.driver.trips.each do |trip|
  		@trip = trip
  	end
  	@book = Book.find_by(trip_id: @trip.id)
  	@user = User.find_by(id: @book.user_id)
  	render 'show' 	
  end

  def show
  	@user = User.find(params[:id])
  end
end
