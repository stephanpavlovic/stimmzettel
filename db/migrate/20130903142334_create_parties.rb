class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
