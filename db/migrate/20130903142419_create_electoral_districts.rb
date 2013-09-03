class CreateElectoralDistricts < ActiveRecord::Migration
  def change
    create_table :electoral_districts do |t|
      t.string :official_id
      t.string :name

      t.timestamps
    end
  end
end
