class Public::FacilitiesController < ApplicationController
  
  def index
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: :true).order(created_at: :desc).page(params[:page]).per(12)
  end

  def show
    @facility = Facility.find(params[:id])

    if @facility.reviews.blank?
      @average_review = 0
    else
      @average_review = @facility.reviews.average(:rate).round(2)
    end
    
    @facilities_review = @facility.reviews.order(created_at: :desc).page(params[:page]).per(8)

  end
  
  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:notice] = "新しいサウナ施設を投稿しました。"
      redirect_to facilities_path
    else
      render :new
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end
  
  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      flash[:notice] = "サウナ施設を編集しました。"
      redirect_to facilities_path
    else
      render :edit
    end
  end

  private 

  def facility_params
    params.require(:facility).permit(
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
