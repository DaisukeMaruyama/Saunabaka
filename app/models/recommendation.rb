class Recommendation < ApplicationRecord
	attachment :image
	belongs_to :user
end
