class CreateSpareyards < ActiveRecord::Migration
  def change
    create_table :spareyards do |t|
      t.string :name
      t.string :province
      t.string :address
      t.string :telephone

      t.timestamps
    end
  end
end
