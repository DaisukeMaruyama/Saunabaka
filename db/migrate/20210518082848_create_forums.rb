class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.text :message
      t.integer :user_id
      t.string :forum_image_id
      t.timestamps
    end
  end
end
