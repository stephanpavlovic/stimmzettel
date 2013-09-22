class CreateBundestagElectionDistrictVotes < ActiveRecord::Migration
  def change
    create_table :bundestag_election_district_votes do |t|
      t.integer :election_id
      t.integer :district_id
      t.integer :vote_count
      t.float :vote_percent
      t.datetime :time
      t.timestamps
    end
  end
end
