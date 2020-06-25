# frozen_string_literal: true

class UserRelationshipsController < ApplicationController
  before_action :logged_in_user
  def create
    @user = User.find_by(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format| # 下記のどっちかが実行される
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = UserRelationship.find_by(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format| # 下記のどっちかが実行される
      format.html { redirect_to @user }
      format.js
    end
  end
end
