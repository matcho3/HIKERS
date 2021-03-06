class Users::RegistrationsController < Devise::RegistrationsController
before_action :authenticate_user!, only: [:edit, :update]
before_action :current_user,   only: [:edit, :update]
  def create
    @user = User.new(user_params)
    file = params[:user][:image]
    @user.set_image(file)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to HIKERS!"
      redirect_to root_url
    else
    	render 'devise/registrations/new'
    end
  end

  def update
  	file = params[:user][:image]
    @user.set_image(file)
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in(@user, :bypass => true)
      redirect_to @user
    else
      render 'devise/registrations/edit'
    end
  end

   def new
     super
   end


  private

	def user_params
	    params.require(:user).permit(:name, :email, :phonenumber, :image, :password, :password_confirmation)
	end

	def set_user
      @user = User.find(params[:id])
    end
end
























# class Users::RegistrationsController < Devise::RegistrationsController
 
#   def build_resource(hash=nil)
#     hash[:uid] = User.create_unique_string
#     super
#   end

  
 
# end