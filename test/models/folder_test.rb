# frozen_string_literal: true

require 'test_helper'

class FolderTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @folder = Folder.new(name: 'テスト用フォルダ', user_id: @user.id)
    @folder = @user.folders.build(name: 'テスト用フォルダ')
  end

  test '存在できる' do
    assert @folder.valid?
  end

  test 'ユーザーidは必須' do
    @folder.user_id = nil
    assert_not @folder.valid?
  end

  test '名前がないといけない' do
    @folder.name = '  '
    assert_not @folder.valid?
  end

  test '説明は255文字以下' do
    @folder.description = 'a' * 256
    assert_not @folder.valid?
  end

  test '順番は時系列になっている' do
    assert_equal folders(:most_recent), Folder.first
  end

end
