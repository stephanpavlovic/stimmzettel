# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :politican do
    name "MyString"
    party_id 1
    electoral_district_id 1
    job "MyString"
    city "MyString"
    year_of_birth "MyString"
    parlament_watch_url "MyString"
  end
end
