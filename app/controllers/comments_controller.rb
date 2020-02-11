class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    find_topic
    return render_not_found if @topic.blank?
    @comment = @topic.comments.create(comment_params.merge(user: current_user))
    @comment.user_id = current_user.id if current_user
    @comment.save

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def edit
    find_topic
    @comment = @topic.comments.find(params[:id])
  end

  def update
    find_topic
    @comment = @topic.comments.find(params[:id])

    if @comment.update(params[:comment].permit(:comment))
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_path(@topic)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_topic
    @topic = Topic.find_by_id(params[:topic_id])
  end
end
