class MessagesController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:message][:sending_id])
    current_user.sending!(@user)
    redirect_to @user
  end

  #def destroy
    #@user = Message.find(params[:id]).sending
    #current_user.unfollow!(@user)
    #redirect_to @user
  #end
end