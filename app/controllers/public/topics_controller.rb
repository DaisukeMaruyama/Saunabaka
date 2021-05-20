class Public::TopicsController < ApplicationController
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = @topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "新規トピックを作成しました。"
      redirect_to topics_path
    else
      render :index
    end
  end

  def destroy
  end

  def edit
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
