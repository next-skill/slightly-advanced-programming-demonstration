require 'minitest/autorun'
require './lib/meta/active_record_imitation'

class User < ActiveRecordImitation
end

class ActiveRecordImitationTest < Minitest::Test
  def test_find_exist_user
    user = User.find(1)
    assert_equal 1, user.id
    assert_equal 'Alice', user.name
  end

  def test_find_nil_user
    assert_equal nil, User.find(2)
  end
end
