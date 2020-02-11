require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should allow users to create comments on topics" do
      topic = FactoryBot.create(:topic)

      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { topic_id: topic.id, comment: { comment: 'awesome' } }

      expect(response).to redirect_to topic_path(topic.id)
      expect(topic.comments.length).to eq 1
      expect(topic.comments.first.comment).to eq "awesome"
    end

    it "should require a user to be logged in to comment on a topic" do
      topic = FactoryBot.create(:topic)
      post :create, params: { topic_id: topic.id, comment: { comment: 'awesome' } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should return http status code of not found if the topic isn't found" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { topic_id: 'YOLOSWAG', comment: { comment: 'awesome' } }
      expect(response).to have_http_status :not_found
    end
  end
end