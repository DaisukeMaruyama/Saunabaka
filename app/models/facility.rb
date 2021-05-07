class Facility < ApplicationRecord

	attachment :image

	enum parking:{有: true, 無: false}

end
