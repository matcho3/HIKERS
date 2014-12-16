namespace :db do
		desc 'サンプルデータを登録する'
  task populate: :environment do
   
    50.times do |n|
      Driver.create(
        user_id: n+1,
        car_image: "8d7cb9e09ece546ef4353defa2fe9377.jpg",
        license_history: '4年',
        time_get_license: Time.now)
    end
  end
end

