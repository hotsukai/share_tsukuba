# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'Example user ', email: 'hoge@fugahoge.com', password: 'foobar', password_confirmation: 'foobar')
  end

  test 'ユーザーが存在する' do
    assert @user.valid?
  end

  test 'ユーザー名が存在してないといけないか' do
    @user.name = '   '
    assert_not @user.valid?
  end

  test 'emailが存在してないといけないか' do
    @user.email = '  '
    assert_not @user.valid?
  end

  test 'ユーザー名が長すぎないか' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'emailが長すぎないか' do
    @user.email = 'hoge' * 70 + 'example.com'
    assert_not @user.valid?
  end

  test '有効なemailを受理' do
    valid_email_adderesses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_email_adderesses.each do |valid_email_adderess|
      @user.email = valid_email_adderess
      assert @user.valid? "#{valid_email_adderess} は受理されるべきです"
    end
  end

  test '無向なemailを受理しない' do
    invald_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invald_addresses.each do |invalid_email_address|
      @user.email = invalid_email_address
      assert_not @user.valid? "#{invalid_email_address} は受理されないべきです"
    end
  end

  test 'emailは重複してはいけない' do
    duplicate_user = @user.dup # コピーを作成
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'emailが小文字で保存されているか' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  # TODO6.3.3

  test 'パスワードは空でない' do
    @user.password = @user.password_confirmation = '' * 6
    assert_not @user.valid?
  end

  test 'パスワードが最小文字数以上' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
