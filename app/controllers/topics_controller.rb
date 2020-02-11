class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
 
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10).order("created_at DESC")
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
    find_topic
  end

  def edit
    find_topic
    verify_user       
  end

  def update
    find_topic
    verify_user
    return render_not_found if @topic.blank?
    @topic.update_attributes(topic_params)
    if @topic.valid?
      redirect_to topic_path(@topic)
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic = Topic.find_by_id(params[:id])
    return render_not_found if @topic.blank?
    return render_not_found(:forbidden) if @topic.user != current_user
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def find_topic
    @topic = Topic.find_by_id(params[:id])
  end

  def verify_user
    if current_user != @topic.user
      return render plain: 'forbidden', status: :forbidden
    end
  end
end
