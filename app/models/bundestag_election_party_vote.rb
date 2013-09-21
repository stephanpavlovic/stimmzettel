class BundestagElectionPartyVote < ActiveRecord::Base
  belongs_to :bundestag_election
  belongs_to :party
end
