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
  end

end
