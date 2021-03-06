class Recommendation < ApplicationRecord

	validates :sauna_name, presence: true
  validates :prefecture, presence: true
  validates :phone_number, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :temperature, presence: true, length: { maximum: 3 }  
  validates :water, presence: true, length: { maximum: 2 }  
  validates :price_description, presence: true
  validates :working_hours, presence: true
  validates :hp, presence: true
  validates :parking, presence: true
  validates :image, presence: true

	attachment :image
	belongs_to :user
end
