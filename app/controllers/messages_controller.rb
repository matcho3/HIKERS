class MessagesController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:message][:receiving_id])
    @content = (params[:message][:content])
    current_user.sending!(@user, @content)
    redirect_to message_path(@user)
    #if @content.save
      #flash[:success] = "Message created!"
      #redirect_to message_path(@user)
    #else
      #@feed_tweets = current_user.messages.paginate(page: params[:page])
      #redirect_to message_path(@user)
    #end
  end

  def index
  end

  def show
    @trip = Trip.find(params[:id])
    @user = @trip.driver.user

    @messages = Message.where('sending_id IN (?) AND receiving_id IN (?)', [current_user.id, @user.id], [@user.id, current_user.id] )
  end

  #def destroy
    #@user = Message.find(params[:id]).sending
    #current_user.unfollow!(@user)
    #redirect_to @user
  #end
end