class Public::ReviewsController < ApplicationController
  before_action :find_facility

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.facility_id = @facility.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to facility_path(@facility)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment)
  end

  def find_facility
    @facility = Facility.find(params[:facility_id])
  end

end
