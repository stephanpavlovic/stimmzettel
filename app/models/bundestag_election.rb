class BundestagElection < ActiveRecord::Base
  has_many :bundestag_election_party_votes
end
