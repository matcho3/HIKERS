namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      birthday = Time.now
      User.create!(name: name,
                   email: email,
                   image: "8d7cb9e09ece546ef4353defa2fe9377.jpg",
                   birthday: Time.now,
                   password: password,
                   password_confirmation: password,
                   id: n+1
                   )
    end
  end
end

