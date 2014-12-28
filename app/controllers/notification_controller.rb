class NotificationController < ApplicationController
  def show
  	@notifications = current_user.notifications
  end
end
