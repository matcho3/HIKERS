class SearchController < ApplicationController
  # def index
  # 	 @search_word = params[:word]
  #   @trips = Trip.where(['departure LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
  #   render 'search/index'
  # end
# 	def index
# 		# @search_word = params[:word]
# 		@trips = Trip.where('departure = ? AND destination >= ?', params[:departure],params[:destination])
# 		render 'search/index'
# 	end
# end



	def index
		# @search_word = params[:word]
		@trips = Trip.all
		if !params[:departure].blank?
			@trips.where!(departure: params[:departure])
		end
		if !params[:destination].blank?
			@trips.where!(destination: params[:destination])
		end
		if !params[:leaving_time].blank?
			@trips.where!(leaving_time: params[:leaving_time])
		end
	end
end