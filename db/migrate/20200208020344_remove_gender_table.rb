class RemoveGenderTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :genders
  end
end
