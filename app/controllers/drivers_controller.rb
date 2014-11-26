class DriversController < ApplicationController
  def new
  end

  def create
    @driver = Driver.new(driver_params)
    file = params[:driver][:car_image]
    @driver.set_car_image(file)
    if @driver.save
      flash[:success] = "Driver Entry Completed!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    file = params[:driver][:car_image]
    @driver.set_car_image(file)
    if @driver.update_attributes(driver_params)
      flash[:success] = "Driver's Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @driver.destroy
    flash[:success] = "driver's profile destroyed."
    redirect_to users_url
  end

  def driver_params
      params.require(:driver).permit(:car_image, :license_history)
  end
end
