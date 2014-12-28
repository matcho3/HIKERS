class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    if current_user.driver.reviews.blank?
        render 'reviews/no_reviews'
    else

    @reviews = Review.where(driver_id: current_user.driver.id)
    end
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
   
    @review = Review.new
    @review.comment =  params[:review][:comment]
    @review.user_id = current_user.id
    @review.driver_id = params[:driver_id]
    @driver = Driver.find(params[:driver_id]);
    @user = @driver.user
    @review.save

    # notificationの保存＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

    @notification = Notification.new
    @notification.user_id = @review.user_id
    @notification.review_id = @review.id
    @notification.body = "あなたに、新しいレビューが書かれました。"
    @notification.save
    # @user = current_user
    if @review.save
      flash[:success] = "Review created!"
      redirect_to @user
    else
      @feed_reviews = @user.reviews.paginate(page: params[:page])
      # render 'about/index'
      # current_user は変更する必要性あり一時的にいれてます。
    end
  end



# create_table "reviews", force: true do |t|
#     t.integer  "user_id"
#     t.integer  "driver_id"
#     t.text     "comment"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end







  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json


  # def update
  #   respond_to do |format|
  #     if @review.update(review_params)
  #       format.html { redirect_to @review, notice: 'Review was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to reviews_url
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment)
      # :user_id, :driver_id,
    end


    def correct_user
      @review = Review.find_by(id: params[:id])
      redirect_to root_url unless current_user?(@review.user)
    end
end
