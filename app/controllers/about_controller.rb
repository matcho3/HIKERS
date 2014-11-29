class AboutController < ApplicationController
  def index
  	 if signed_in?
      @review = current_user.reviews.build
      @feed_reviews = current_user.reviews.paginate(page: params[:page])
    end
  end
end
