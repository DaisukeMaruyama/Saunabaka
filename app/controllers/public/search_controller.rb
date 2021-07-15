class Public::SearchController < ApplicationController

  def search
    @value = params["search"]["value"]
    @facilities = search_for_item(@value).order(created_at: :desc)
  end

  private

  def search_for_item(value)
    Facility.where("sauna_name LIKE ?", "%#{value}%")
  end

end
