class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :address, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.references :review, foreign_key: true, null: false
      t.timestamps
    end
  end
end
