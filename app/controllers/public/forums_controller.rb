class Public::ForumsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]

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
      @topic = Topic.find_by(id: params[:forum][:topic_id])
      @forums = Forum.all
      flash[:alert] = "投稿に失敗しました。"
      render template: "public/topics/show" 
      #redirect_back(fallback_location: topic_path(params[:forum][:topic_id]))
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    if @forum.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_back(fallback_location: topic_path)
    else
      redirect_back(fallback_location: topic_path)
    end
  end

  private

  def forum_params
    params.require(:forum).permit(:message, :forum_image, :topic_id)
  end

end
