FactoryBot.define do

  factory :review do
    association :user
    title              {"タイトルが入ります"}
    description        {"説明文が入ります"}
    rating             { "5" }
    status             { 1 }
    tag_list           {"タグが入ります"}
  end

end