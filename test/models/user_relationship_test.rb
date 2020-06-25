# frozen_string_literal: true

require 'test_helper'

class UserRelationshipTest < ActiveSupport::TestCase
  def setup
    @user_relationship = UserRelationship.new(follower_id: users(:michael).id,
                                              followed_id: users(:archer).id)
  end

  test '存在する' do
    assert @user_relationship.valid?
  end

  test 'follower_idが必須である' do
    @user_relationship.follower_id = nil
    assert_not @user_relationship.valid?
  end

  test 'followed_idが必須である' do
    @user_relationship.followed_id = nil
    assert_not @user_relationship.valid?
  end
end
