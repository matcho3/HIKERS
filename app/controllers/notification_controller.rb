class NotificationController < ApplicationController
  def index
  	@trip = current_user.driver.trips
  	@book = Book.find_by(trip_id: @trip)
  	@user = User.find_by(id: @book.user_id)
  	render 'show' 	
  end

  def show
  	@user = User.find(params[:id])
  end
end



