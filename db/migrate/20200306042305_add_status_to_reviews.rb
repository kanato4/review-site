class AddStatusToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :status, :integer, null: false
  end
end
