class Public::FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def show
  end

  def create
  end

  def destroy
  end

  def edit
  end
end
