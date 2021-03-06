class Public::RecommendationsController < ApplicationController

  def index
    @recommendations = Recommendation.all.page(params[:page]).per(12)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.create(recommendation_params)
    @recommendation.user_id = current_user.id
    if @recommendation.save
      flash[:notice] = "おすすめサウナを投稿しました。"
      redirect_to recommendations_path
    else
      render :new
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update(recommendation_params)
      flash[:notice] = "サウナ施設情報を更新しました。"
      redirect_to recommendations_path
    else
      render :edit
    end
  end

  def destroy
  end

  def recommendation_params
    params.require(:recommendation).permit(
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
