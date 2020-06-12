# frozen_string_literal: true

require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test '店舗登録ページを見れる' do
    get new_restaurant_path
    assert_response :success
  end
end
