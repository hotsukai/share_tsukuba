# frozen_string_literal: true

require 'test_helper'

class FoldersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @folder = folders(:orange)
  end

  test 'ログインなしでcreateしたときにリダイレクト' do
    assert_no_difference 'Folder.count' do
      post folders_path, params: { folder: { name: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'ログインなしでdestroyしたときにリダイレクト' do
    assert_no_difference 'Folder.count' do
      delete folder_path(@folder)
    end
    assert_redirected_to login_url
  end
end
