json.array!(@reviews) do |review|
  json.extract! review, :user_id, :driver_id, :comment
  json.url review_url(review, format: :json)
end