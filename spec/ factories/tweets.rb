FactoryBot.define do
  factory :tweet do
    text {"hello!"}
    image {"hoge.png"}
    user
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end