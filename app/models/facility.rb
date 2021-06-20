class Facility < ApplicationRecord

	has_many :favorites , dependent: :destroy
	attachment :image

	enum parking:{有: true, 無: false}

end
