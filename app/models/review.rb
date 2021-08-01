class Review < ApplicationRecord

  validates :rate, presence: true
  validates :comment, presence: true

  belongs_to :facility
end
