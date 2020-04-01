FactoryBot.define do
  factory :post do
    title              { Faker::Book.title }
    content            { "コンテンツの内容" }
    images {[FactoryBot.build(:image, post: nil)]}
    user
    category
  end
end