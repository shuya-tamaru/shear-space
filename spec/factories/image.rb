FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/app/assets/images/member_photo_noimage_thumb.png")}
    association :post
  end
end