require 'minitest/autorun'
require 'stringio'

class ThreadUnsafeVariableCountTest < Minitest::Test
  def setup
    $stdout = StringIO.new
  end

  def test_count
    100.times do
      load './lib/thread/thread_unsafe_variable_count.rb'
    end

    out = $stdout.string
    lines = out.each_line(chomp: true)

    assert_includes lines, '1'
    assert_includes lines, '2'
  end

  def teardown
    $stdout = STDOUT
  end
end
