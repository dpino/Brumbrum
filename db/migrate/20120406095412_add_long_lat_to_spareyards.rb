class AddLongLatToSpareyards < ActiveRecord::Migration
  def change
    add_column :spareyards, :latitude, :float

    add_column :spareyards, :longitude, :float

    add_column :spareyards, :gmaps, :boolean

  end
end
