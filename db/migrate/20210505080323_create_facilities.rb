class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :sauna_name
      t.string :temperature
      t.string :water
      t.string :prefecture
      t.string :postal_code
      t.string :address
      t.string :image_id
      t.string :working_hours
      t.string :phone_number
      t.text :price_description
      t.string :hp
      t.boolean :parking

      t.timestamps
    end
  end
end
