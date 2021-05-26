class Public::RecommendationsController < ApplicationController

  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
