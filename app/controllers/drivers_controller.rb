class DriversController < ApplicationController
before_action :set_driver, only: [:show, :edit, :update, :destroy]


  def new
    @driver = Driver.new
  end

  def edit
  end


  def create
    @driver = Driver.new(driver_params)
    @driver.user_id = current_user.id
    file = params[:driver][:car_image]
    @driver.set_car_image(file)
    if @driver.save
      flash[:success] = "Driver Entry Completed!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    file = params[:driver][:car_image]
    @driver.set_car_image(file)
    if @driver.update_attributes(driver_params)
      flash[:success] = "Driver's Profile Updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @driver.destroy
    flash[:success] = "driver's profile destroyed."
    redirect_to users_url
  end
  
  private
   def driver_params
      params.require(:driver).permit(:license_history, :time_get_license)
   end

   def set_driver
      @driver = Driver.find(params[:id])
   end

   def signed_in_driver
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
   end
end
