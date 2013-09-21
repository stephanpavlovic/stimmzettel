class CreateBundestagElectionPartyVotes < ActiveRecord::Migration
  def change
    create_table :bundestag_election_party_votes do |t|
      t.integer :bundestag_election_id
      t.integer :party_id
      t.integer :vote_count
      t.float :vote_percent

      t.timestamps
    end
  end
end
