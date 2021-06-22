class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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

  def withdraw
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
