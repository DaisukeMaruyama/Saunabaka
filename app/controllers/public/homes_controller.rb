class Public::HomesController < ApplicationController

  def top
    @facilities = Facility.find(Favorite.group(:facility_id).order('count(facility_id) desc').limit(3).pluck(:facility_id))
  end

  def about
  end
  
end
