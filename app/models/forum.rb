class Forum < ApplicationRecord
	attachment :forum_image
	belongs_to :user
	belongs_to :topic
end
