FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              {password}
    password_confirmation {password}
    image                 {File.open("#{Rails.root}/app/assets/images/member_photo_noimage_thumb.png")}
  end
end