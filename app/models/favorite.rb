class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :facility

  def favorited_by?(current_user)
    favorites.where(user_id: current_user.id).exists?
  end
  
end
