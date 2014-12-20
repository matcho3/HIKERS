class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def application
  	# @string = "hi"
    
  	current_user.driver.trips.each do |trip|
  		@trip = trip
  	end
  	@book = Book.find_by(trip_id: @trip.id)
  	@user = @book.user
  	render 'show'
  end
end