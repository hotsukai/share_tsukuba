# frozen_string_literal: true

require 'test_helper'

class UserRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test 'ログインしていないとフォローできない' do
    assert_no_difference 'UserRelationship.count' do
      post user_relationships_path
    end
    assert_redirected_to login_url
  end

  test 'ログインしていないとリムーブできない' do
    assert_no_difference 'UserRelationship.count' do
      delete user_relationship_path(user_relationships(:one))
    end
    assert_redirected_to login_url
  end
end
