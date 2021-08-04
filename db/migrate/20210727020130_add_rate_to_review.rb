class AddRateToReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :rate, null: false
      t.text :comment
      t.references :user, foreign_key: true
      t.references :facility, foreign_key: true
    
      t.timestamps
    end
  end
end
