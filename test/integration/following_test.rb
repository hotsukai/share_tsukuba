# frozen_string_literal: true

require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other = users(:archer)
    log_in_as(@user)
  end

  test 'フォロー一覧ページ' do
    get following_user_path(@user)
    assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user.following.each do |user|
      assert_select 'a[href=?]', user_path(user)
    end
  end

  test 'フォロワー一覧ページ' do
    get followers_user_path(@user)
    assert_not @user.followers.empty?
    assert_match @user.followers.count.to_s, response.body
    @user.followers.each do |user|
      assert_select 'a[href=?]', user_path(user)
    end
  end
  test 'フォローできる' do
    assert_difference '@user.following.count', 1 do
      post user_relationships_path, params: { followed_id: @other.id }
    end
  end

  test 'フォローできる Ajax' do
    assert_difference '@user.following.count', 1 do
      post user_relationships_path, xhr: true, params: { followed_id: @other.id }
    end
  end

  test 'リムーブできる' do
    @user.follow(@other)
    relationship = @user.active_relationships.find_by(followed_id: @other.id)
    assert_difference '@user.following.count', -1 do
      delete user_relationship_path(relationship)
    end
  end

  test 'リムーブできるAjax' do
    @user.follow(@other)
    relationship = @user.active_relationships.find_by(followed_id: @other.id)
    assert_difference '@user.following.count', -1 do
      delete user_relationship_path(relationship), xhr: true
    end
  end
end
