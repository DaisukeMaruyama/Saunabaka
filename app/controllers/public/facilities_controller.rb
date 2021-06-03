class Public::FacilitiesController < ApplicationController
  def index
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: :true).order(created_at: :desc)
  end

  def show
    @facility = Facility.find(params[:id])
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
			render :index
		end
  end

  def destroy
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
