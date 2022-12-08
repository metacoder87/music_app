FactoryBot.define do
  factory :album do
    title { "MyString" }
    year { 1 }
    live { false }
    band_id { nil }
  end
end
