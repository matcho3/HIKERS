class TripsController < ApplicationController

	 before_action :set_trip, only: [:show, :edit, :update, :destroy]
	def new
    	@trip = Trip.new
  	end

  	def create
  		@trip = current_user.driver.trips.build(trip_params)
    	if @trip.save
      		flash[:success] = "Trip Entry Completed!"
      		redirect_to root_url
    	else
      		render 'new'
    	end
  	end

  	def show
      @trip = Trip.find(params[:id])
  	end
  	
  	def edit
  	end

    def update
    end

  	def index
  	end

  	def destroy
    	@trip.destroy
    	flash[:success] = "trip destroyed."
    	redirect_to drivers_url
  	end

private
   def trip_params
      params.require(:trip).permit(:departure, :destination, :leaving_time, :capacity, :price)
   end

   def set_trip
      @trip = Trip.find(params[:id])
   end
end