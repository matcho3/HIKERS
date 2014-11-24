class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
   
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = current_user.build_user_profile(user_profile_params)
    file = params[:user_profile][:image]
    @user_profile.set_image(file)
    if @user_profile.save
       redirect_to @user_profile 
     else
      render 'new'
    end
  end


  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
     file = params[:user_profile][:image]
     @user_profile.set_image(file)
     # @user_profile.name = params[:user_profile][:name]
     # @user_profile.image = params[:user_profile][:image]
     # @user_profile.save
      if @user_profile.update_attributes(user_profile_params)
         redirect_to @user_profile
      else
         render 'edit'
      end
  end


  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :no_content }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.



    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:name, :birthday, :user_id)
    end
end

