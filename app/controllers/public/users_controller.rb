class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:facility_id)  # ログイン中のユーザーのお気に入りのfavorite_idカラムを取得
    @favorite_list = Facility.find(favorites)  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if User.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to user_path
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def withdraw
    @user.update(is_delete: "deleted")
    reset_session
    flash[:notice] = "退会処理が完了しました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
