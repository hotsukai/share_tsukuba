# frozen_string_literal: true

require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test 'プロフィールの表示' do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h4', text: @user.name
    assert_select 'h4>img.gravatar'
    # assert_match @user.folders.count.to_s, response.body
    assert_select 'nav.pagination'
    @user.folders.page(1).each do |folder|
      assert_match folder.name, response.body
      # assert_match folder.description, response.body
    end
  end
end
