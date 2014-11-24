module UsersHelper
  def profile_image_for(user_profile, size = '52')
    image_tag "/docs/#{user_profile.image}", size: size, class: :gravatar
  end
end
