class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      t.string :facility_name
      t.string :temperature
      t.string :water
      t.string :prefecture
      t.string :postal_code
      t.string :address
      t.string :working_hours
      t.string :phone_number
      t.text :price_description
      t.string :hp
      t.boolean :parking

      t.timestamps
    end
  end
end
