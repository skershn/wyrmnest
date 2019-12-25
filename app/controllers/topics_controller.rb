class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
 
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.create(topic_params)
    if @topic.valid?
      redirect_to topics_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @topic = Topic.find(params[:id])
    #add comments
  end

  def edit
    @topic = Topic.find(params[:id])

    if @topic.user != current_user
      return render plain: 'forbidden', status: :forbidden
    end      
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(topic_params)
    redirect_to topics_path #ask about redirecting back to the thread itself
  end

  def destroy
    #figure out how to delete OP and leave thread/comments intact
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
