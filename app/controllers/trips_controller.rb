class TripsController < ApplicationController

	 before_action :set_trip, only: [:show, :edit, :update, :destroy, :book]
	def new
    	@trip = Trip.new
  	end

  	def create
  		@trip = current_user.driver.trips.build(trip_params)
    	if @trip.save
      		flash[:success] = "Trip Entry Completed!"
      		redirect_to @trip
    	else
      		render 'new'
    	end
  	end

    def book
      @trip = Trip.find(params[:id])
      @book = Book.new
      @book.user_id = current_user.id 
      @book.trip_id = @trip.id
      @book.save

      @notification = Notification.new
      @notification.user_id = @book.user_id
      @notification.book_id = @book.id
      # @notification.book_id = @book.id
      @notification.body = "あなたのトリップに、申請がありました。"
      @notification.save
      # @book = current_user.books.create(trip_id: @trip.id)
      # @book.save
        flash[:success] = "Your book request has been confirmed!!"
    end


# create_table "notifications", force: true do |t|
#     t.integer  "user_id"
#     t.text     "body"
#     t.integer  "read_flag",  default: 0
#     t.integer  "review_id"
#     t.integer  "book_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end


















def index
  end

  def purchase
    # WebPay.api_key = WEBPAY_SECRET_KEY
    webpay = WebPay.new(WEBPAY_SECRET_KEY)
    # WebPay::Charge.create(currency: 'jpy', amount: 1000, card: params['webpay-token'])
    charge = webpay.charge.create(currency: 'jpy', amount: 4000, card: params['webpay-token'])
    flash.now[:notice] = '支払いが完了しました'
    redirect_to action: :purchased
  end

def purchased
  end




  	def show
      # @trip = Trip.find(params[:id])
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
      params.require(:trip).permit(:departure, :destination, :leaving_time, :capacity, :price, :purpose)
   end

   def set_trip
      @trip = Trip.find(params[:id])
   end
end