class Public::RecommendationsController < ApplicationController

  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.create(recommendation_params)
    if @recomendation.save
      flash[:notice] = "おすすめサウナを投稿しました。"
      redirect_to recommendations_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def recommendation_params
    params.require(:recomendation).permit(
      :image,
			:sauna_name,
      :temperature,
      :water,
      :prefecture,
      :postal_code,
      :address,
      :working_hours,
      :phone_number,
      :price_description,
      :hp,
      :parking
    )
  end

end
