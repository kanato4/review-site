FactoryBot.define do

  factory :user do
    nickname              {"tester"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birthday              {"2020-3-3"}
    gender                { 1 }
  end

end