require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:topic) { FactoryBot.create(:topic, title: topic_title, content: topic_content) }
  let(:topic_title) { 'a' }
  let(:topic_content) { 'aaa' }
  let(:user) { FactoryBot.create(:user) }


  describe "topics#index action" do
    it "should show the list of forum threads" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "topics#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "topics#create action" do
    it "should require users to be logged in" do
      post :create, params: { topic: { title: "hello", content: "hello world!" } }
      expect(response).to redirect_to new_user_session_path
    end
    it "should successfully create a new topic in our database" do
      sign_in user

      post :create, params: { 
        topic: {
          title: 'hello!',
          content: 'greetings and salutations'
        }
      }
      
      expect(response).to redirect_to topics_path

      topic = Topic.last
      expect(topic.title).to eq("hello!")
      expect(topic.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      sign_in user
      post :create, params: { topic: { title: '', content: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Topic.count).to eq Topic.count
    end
  end

  describe "topics#destroy action" do
    it "shouldn't allow users who didn't create the topic to destroy it" do
      sign_in user
      delete :destroy, params: { id: topic.id }
      expect(response).to have_http_status(:forbidden)
    end

    it "shouldn't let unauthenticated users destroy a topic" do
      delete :destroy, params: { id: topic.id }
      expect(response).to redirect_to new_user_session_path
    end

    it "should allow a user to destroy topics" do
      sign_in topic.user
      delete :destroy, params: { id: topic.id }
      expect(response).to redirect_to topics_path
      topic_to_destroy = Topic.find_by_id(topic.id)
      expect(topic_to_destroy).to eq nil
    end

    it "should return a 404 message if we cannot find a topic with the id that is specified" do
      sign_in user
      delete :destroy, params: { id: 'SPACEDUCK' }
      expect(response).to have_http_status(:not_found)
    end
  end

end
