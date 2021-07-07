class ApplicationController < ActionController::Base
  before_action :set_search
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #これを定義しないとNo Ransack::Search object was provided to search_form_for!エラーが出る
  def set_search
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: :true).order(created_at: :desc)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
