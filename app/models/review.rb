class Review < ApplicationRecord
	validates :rate, presence: true
	validates :comment, presence: true
end
