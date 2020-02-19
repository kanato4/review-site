class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description, null: false
      t.float :rating, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
