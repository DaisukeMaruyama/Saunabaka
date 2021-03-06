class Public::ReviewsController < ApplicationController
  before_action :find_facility
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.facility_id = @facility.id
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to facility_path(@facility)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "レビューを更新しました。"
      redirect_to facility_path(@facility)
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:notice] = "レビューを削除しました。"
      redirect_to facility_path(@facility)
    end  
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment)
  end

  def find_facility
    @facility = Facility.find(params[:facility_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
