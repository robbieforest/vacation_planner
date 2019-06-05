class CreateTripDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_details do |t|
      t.integer :trip_id
      t.string :description
      t.string :price
      t.string :url
      t.integer :detail_type_id

      t.timestamps
    end
  end
end
