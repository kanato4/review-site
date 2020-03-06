FactoryBot.define do

  factory :review do
    title              {"タイトルが入ります"}
    description        {"説明文が入ります"}
    rating             { "5" }
    status             { 1 }
    user_id            { 1 }
  end

end