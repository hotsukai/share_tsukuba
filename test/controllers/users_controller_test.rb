# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'サインアップページへ行ける' do
    get signup_path
    assert_response :success
  end
end
