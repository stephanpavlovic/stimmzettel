class BundestagElectionDistrictVote < ActiveRecord::Base
  belongs_to :bundestag_election
  belongs_to :electoral_district
end
