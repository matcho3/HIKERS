json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :name, :birthday, :user_id, :image
  json.url user_profile_url(user_profile, format: :json)
end