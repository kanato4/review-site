class RenameLatColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :lat, :latitude
    rename_column :spots, :lng, :longitude
  end
end
