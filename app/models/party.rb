class Party < ActiveRecord::Base
  has_many :politicans
  has_many :bundestag_election_party_votes
end
