class Facility < ApplicationRecord

	has_many :favorites , dependent: :destroy
	attachment :image

	enum parking:{有: true, 無: false}

	def favorited_by?(current_user)
    favorites.where(user_id: current_user.id).exists?
  end

end
