class AboutController < ApplicationController
  def index
  	 if signed_in?
      # @review = current_user.reviews.build
      # @feed_reviews = current_user.reviews.paginate(page: params[:page])
    end

    @users = User.all
  	# 実験的にユーザが表示されるかみます
  end



end


