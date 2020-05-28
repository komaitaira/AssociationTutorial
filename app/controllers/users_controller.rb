class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    # ===============追加==============
    @tweets = @user.tweets #@user.tweetsは複数のツイートが入った配列となっております。
    # ================================
    @favorite_tweets = @user.favorite_tweets # 追加
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
