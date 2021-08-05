class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facility

  def create
      Favorite.create(user_id: current_user.id, facility_id: @facility.id)
      flash[:notice] = "お気に入りに追加しました。"
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, facility_id: @facility.id)
    @favorite.destroy
    flash[:notice] = "お気に入りを解除しました。"
  end

  def userFavoriteDelete
    @favorite = Favorite.find_by(user_id: current_user.id, facility_id: @facility.id)
    @favorite.destroy
    flash[:notice] = "お気に入りを解除しました。"
    redirect_to user_path(current_user.id)
  end

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

end
