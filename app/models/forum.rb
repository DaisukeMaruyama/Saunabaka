class Forum < ApplicationRecord
	attachment :forum_image
  belongs_to :user
end
