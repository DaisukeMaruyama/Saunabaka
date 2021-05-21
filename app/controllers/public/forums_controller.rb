class Public::ForumsController < ApplicationController

  def index
    @forums = Forum.all
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.user_id = current_user.id
    if @forum.save
      flash[:notice] = "新規投稿しました。"
      redirect_to topic_path(params[:forum]['topic_id'])
    else
      render :back
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
    params.require(:forum).permit(:message, :forum_image, :topic_id)
  end

end
