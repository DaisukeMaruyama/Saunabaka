class Topic < ApplicationRecord
	belongs_to :user
	has_many :forums, dependent: :destroy
end
