class Public::TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create, :show]

  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: :true).order(created_at: :desc)
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @forum= Forum.new(:topic_id => params[:id]) 
    @forums = Forum.where(topic_id: params[:id])
  end

  def create
    @topic = Topic.create(topic_params)
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

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
