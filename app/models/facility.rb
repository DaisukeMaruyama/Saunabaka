class Facility < ApplicationRecord

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

  has_many :reviews, dependent: :destroy
  has_many :favorites , dependent: :destroy
  attachment :image

  enum parking:{有: true, 無: false}

  def favorited_by?(current_user)
    favorites.where(user_id: current_user.id).exists?
  end

end
