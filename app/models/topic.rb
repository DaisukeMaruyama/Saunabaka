class Topic < ApplicationRecord
	
  validates :title, presence: true

	belongs_to :user
	has_many :forums, dependent: :destroy
end
