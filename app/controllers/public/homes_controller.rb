class Public::HomesController < ApplicationController

  def top
    @facilities = Facility.all.order(created_at: :desc).limit(3)
  end

  def about
  end
  
end
