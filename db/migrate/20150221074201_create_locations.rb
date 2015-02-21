class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :latlong
      t.string :pos_name
      t.string :email

      t.timestamps
    end
  end
end
