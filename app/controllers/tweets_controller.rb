class TweetsController < ApplicationController
  before_action :move_index ,except: :index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order('created_at DESC')#page(10)と書けば10ページに固定される
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image],text: tweet_params[:text],user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
    redirect_to '/'
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:image ,:text)
  end

  def move_index
    redirect_to '/'  unless user_signed_in?
  end
end
