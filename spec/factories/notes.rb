FactoryBot.define do
  factory :note do
    track_id { 1 }
    user_id { 1 }
    content { "MyText" }
  end
end
