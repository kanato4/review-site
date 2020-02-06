class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.references :user, foreign_key: true, null: false
      t.string :position, null: false
      t.timestamps
    end
  end
end
