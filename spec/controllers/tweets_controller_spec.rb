require 'rails_helper'

describe TweetsController do
  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    # editアクションをリクエストした後、edit.html.erbに遷移するか
    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3) 
      get :index
    end

    it "renders the :index template" do
    end
  end

end