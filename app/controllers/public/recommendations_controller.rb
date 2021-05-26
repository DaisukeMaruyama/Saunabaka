class Public::RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def show
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
