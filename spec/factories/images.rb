FactoryBot.define do

  factory :image do
    association :review
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png')) }
  end
end