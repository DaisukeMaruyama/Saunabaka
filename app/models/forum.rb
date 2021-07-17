class Forum < ApplicationRecord

	validates :message, presence: true
	validates :topic_id, presence: true

	attachment :forum_image
	belongs_to :user
	belongs_to :topic
end
