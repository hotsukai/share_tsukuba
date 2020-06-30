# frozen_string_literal: true

require 'test_helper'

class FolderSpotRelationshipsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @user2 = users(:archer)

    @folder = folders(:orange)
    @spot1 = spots(:one)
    @spot2 = spots(:two)
  end

  test 'AJAXでフォルダにスポットを追加できる' do
    log_in_as(@user)
    get spot_path(id: @spot2.id)
    assert_not @folder.spots.include?(@spot2)
    assert_difference 'FolderSpotRelationship.count', 1 do
      post folder_spot_relationships_path, params: { folder_spot_relationship: { folder_id: @folder.id,
                                                                                 spot_id: @spot2.id,
                                                                                 comment: 'hoge' } }, xhr: true
    end
    assert @folder.spots.include?(@spot2)
  end

  test 'AJAX無しの時、フォルダにスポットを追加できる' do
    log_in_as(@user)
    get spot_path(id: @spot2.id)
    assert_not @folder.spots.include?(@spot2)
    assert_difference 'FolderSpotRelationship.count', 1 do
      post folder_spot_relationships_path, params: { folder_spot_relationship: { folder_id: @folder.id,
                                                                                 spot_id: @spot2.id,
                                                                                 comment: 'hoge' } }
    end
    assert @folder.spots.include?(@spot2)
  end

  test '他人のフォルダに追加できない' do
    log_in_as(@user2)
    get spot_path(id: @spot2.id)
    assert_no_difference 'FolderSpotRelationship.count' do
      post folder_spot_relationships_url, params: { folder_spot_relationship: { folder_id: @folder.id,
                                                                                spot_id: @spot2.id,
                                                                                comment: 'hoge' } }, xhr: true
    end
    assert_redirected_to root_url
  end

  # test "フォルダにスポットの重複が発生してはいけない" do
  #   assert true
  # end

  test 'フォルダからスポットを削除できる' do
    assert true
  end
end
