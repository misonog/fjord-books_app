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

  test 'followしているかの判定' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    assert bob.following?(alice)
  end

  test 'followされているかの判定' do
    alice = users(:alice)
    bob = users(:bob)
    assert alice.followed_by?(bob)
    assert_not bob.followed_by?(alice)
  end

  test 'ユーザーをfollowする' do
    alice = users(:alice)
    bob = users(:bob)
    alice.follow(bob)
    assert bob.followers.include?(alice)
  end

  test 'ユーザーをunfollowする' do
    alice = users(:alice)
    bob = users(:bob)
    bob.unfollow(alice)
    assert_not alice.followers.include?(bob)
  end
end
