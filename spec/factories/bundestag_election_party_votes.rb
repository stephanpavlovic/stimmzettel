# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bundestag_election_party_vote do
    party_id 1
    vote_number 1
    vote_percent ""
  end
end
