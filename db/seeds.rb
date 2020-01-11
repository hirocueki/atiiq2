Faker::Config.locale = :ja

def build_items(user)
  5.times.map do |n|
    user.items.create!(
        title:    Faker::Lorem.question,
        tag_list: 3.times.map { Faker::Artist.name }.join(","),
        content:  Faker::Lorem.sentence
    )
  end
end

40.times do |n|
  User.new(
      name:                  Faker::Name.name,
      email:                 "user#{n}-test@sample.com",
      password:              '111111',
      password_confirmation: '111111'
  ) do |user|
    build_items user
    user.save!
  end
end
