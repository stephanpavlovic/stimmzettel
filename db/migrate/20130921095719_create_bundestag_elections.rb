class CreateBundestagElections < ActiveRecord::Migration
  def change
    create_table :bundestag_elections do |t|
      t.date :elective_date
      t.integer :elective_count
      t.float :elective_percent
      t.integer :had_choosen_count
      t.float :had_choosen_percent
      t.integer :valid_votes_count
      t.float :valid_votes_percent

      t.timestamps
    end
  end
end
