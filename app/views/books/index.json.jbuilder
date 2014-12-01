json.array!(@books) do |book|
  json.extract! book, :trip_id, :user_id, :reservations, :status
  json.url book_url(book, format: :json)
end