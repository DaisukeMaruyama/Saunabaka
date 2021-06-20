class Public::FavoritesController < ApplicationController

  before_action :set_facility

  def create
    if @facility.user_id != current_user.id 
      Favorite.create(user_id: current_user.id, facility_id: @facility.id)
      flash[:notice] = "お気に入りに追加しました。"
    end
  end

  def destory
  end

  def set_facility
    @facility = Facility.find(params[:id])
  end

end
