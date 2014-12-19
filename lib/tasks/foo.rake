namespace :db do
	desc 'サンプルデータを登録する'
  task populate: :environment do
    50.times do |n|
    	# departure = Faker::Address.city
    	destination = Faker::Address.city
    	leaving_time = Time.now
      Trip.create(
        departure: 'osaka',
        destination: destination,
        leaving_time: Time.now,
        capacity: '5人',
        price: '3000円',
        driver_id: n+1
      )
    end
  end
end

