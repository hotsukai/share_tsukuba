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

  test '異なるユーザーのフォルダを削除仕様とするとリダイレクトする。' do
    log_in_as(users(:michael))
    folder = folders(:ants)
    assert_no_difference 'Folder.count' do
      delete folder_path(folder)
    end
    assert_redirected_to root_url
  end

  test '異なるユーザーのフォルダを編集しようとするとリダイレクトする。' do
    log_in_as(users(:archer))
    get root_path
    original_name = @folder.name
    patch folder_path(@folder), params: { folder: { name: 'hoge', description: 'fugaguga' } }
    assert_redirected_to root_url
    assert original_name == @folder.name
  end
end
