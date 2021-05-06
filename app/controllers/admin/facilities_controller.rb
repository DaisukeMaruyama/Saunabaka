class Admin::FacilitiesController < ApplicationController

	def index
    @facilities = Facility.all
  end

	def show
	end
	
	def new
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
	end

	private 

	def facility_params
		params.require(:facility).permit(
			:sauna_name
      :temperature
      :water
      :prefecture
      :postal_code
      :address
      :image_id
      :working_hours
      :phone_number
      :price_description
      :hp
      :parking
		)
	end
	
end
