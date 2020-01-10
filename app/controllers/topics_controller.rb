class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
 
  def index
    @topics = Topic.all.order("created_at DESC")
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
    verify_user       
  end

  def update
    @topic = Topic.find(params[:id])
    verify_user
    @topic.update_attributes(topic_params)
    redirect_to topic_path(@topic) #ask about redirecting back to the thread itself
  end

  def destroy
    #boolean thread
    verify_user
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

  def verify_user
    if current_user != @topic.user
      return render plain: 'forbidden', status: :forbidden
    end
  end
end
