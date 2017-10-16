FactoryGirl.define do

  factory :message do
    message   Faker::Lorem.sentence
    image     Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/img/kandume_tomato.png'))
    group
    user
  end

end




