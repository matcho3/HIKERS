module UsersHelper
  def profile_image_for(user, size = '120')
    image_tag "/docs/#{user.image}", size: size, class: :gravatar
  end

  #current_userの存在の確認
  def current_user?(user)
     user == current_user
  end



end
