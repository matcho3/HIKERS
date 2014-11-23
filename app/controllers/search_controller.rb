class SearchController < ApplicationController
  def index
  	 @search_word = params[:word]
    @departures = Trip.where(['departure LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
    render 'search/index'
  end
end
