class Public::ForumsController < ApplicationController

  def index
    @forums = Forum.all
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.create(forum_params)
    @forum.user_id = current_user.id
    if @forum.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to forums_path
    else
      render :new
    end   
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def forum_params
    params.require(:forum).permit(:message, :forum_image)
  end

end
