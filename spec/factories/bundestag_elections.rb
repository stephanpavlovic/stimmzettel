# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bundestag_election do
    elective_count 1
    elective_percent 1.5
    had_choosen_count 1
    had_choosen_percent 1.5
    valid_votes_count 1
    valid_votes_percent 1.5
  end
end
