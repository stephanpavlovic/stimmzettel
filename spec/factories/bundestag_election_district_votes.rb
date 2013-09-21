# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bundestag_election_district_vote do
    district_id 1
    vote_count 1
    vote_percent 1.5
  end
end
