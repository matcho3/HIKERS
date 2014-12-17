class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_filter :authenticate_user!
  # user_signed_in?
  # user_sessionde

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  
    # @reviews = @user.reviews.paginate(page: params[:page])
    # @feed_reviews = current_user.reviews.paginate(page: params[:page])

  # def show
  #   if !@user.driver == nil
  #     @trips = current_user.driver.trips
  #     @trips.each do |trip|
  #       @books = trip.books
  #     end
  #     @books.each do |book|
  #      @user = book.user
  #     end
  #   end
  # end

  def show
    @user = User.find(params[:id])
    
  end



  def book
    @trips = current_user.driver.trips
      @trips.each do |trip|
      @books = trip.books
      end
      @books.each do |book|
      @user = book.user
      end
  end








    # users = User.all
    # liked_users = current_user.likeds
    # liked_users.each do |user|
    #   users.where!.not(id: user.id
    # end

    # relationships  = Relationship.where(liked_id: current_user.id, match_flag: ['1','2'])
    # relationships.each do |relationship|
    #   users.where!.not(id: relationship.liking_id)
    # end
    
    # users.where!.not(id: current_user.id)

    # @user = users.order("RANDOM()").first
    # if @user
    #   @videos = @user.videos.paginate(page: params[:page])

    #   render 'show'
    #   else
    #     render 'no_one'
    # end


# user.driver.trips
# trip.books
# book.user

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    file = params[:user][:image]
    @user.set_image(file)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to HIKERS!"
      redirect_to root_url
    else
      render 'new'
    end
  end
# (validate: false)
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  def update
    file = params[:user][:image]
    @user.set_image(file)
    # raise 'hi'
    if @user.update_attributes(user_profile_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :sex)
    end

    def user_profile_params
      params.require(:user).permit(:name, :birthday)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
