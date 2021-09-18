# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '名前が設定されている場合は名前を返す' do
    user = users(:alice)
    assert_equal 'alice', user.name_or_email
  end

  test '名前が設定されていない場合はメールアドレスを返す' do
    user = users(:alice)
    user.name = ''
    assert_equal 'alice@example.com', user.name_or_email
  end

  test 'ユーザーをfollowとunfollowできる' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)

    alice.follow(bob)
    assert alice.following?(bob)
    assert bob.followed_by?(alice)

    alice.unfollow(bob)
    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
  end
end
