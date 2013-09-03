class CreatePoliticans < ActiveRecord::Migration
  def change
    create_table :politicans do |t|
      t.string :name
      t.integer :party_id
      t.integer :electoral_district_id
      t.string :job
      t.string :city
      t.string :year_of_birth
      t.string :parlament_watch_url

      t.timestamps
    end
  end
end
