# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'ログインページに行ける' do
    get login_path
    assert_response :success
  end
end
