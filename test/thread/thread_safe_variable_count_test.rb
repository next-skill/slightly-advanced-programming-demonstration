require 'minitest/autorun'
require 'stringio'

class ThreadUnsafeVariableCountTest < Minitest::Test
  def setup
    $stdout = StringIO.new
  end

  def test_count
    100.times do
      load './lib/thread/thread_safe_variable_count.rb'
    end

    out = $stdout.string
    lines = out.each_line(chomp: true)

    assert_equal false, lines.include?('1')
    assert_equal true, lines.include?('2')
  end

  def teardown
    $stdout = STDOUT
  end
end
