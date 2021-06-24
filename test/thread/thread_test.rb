require 'minitest/autorun'
require 'stringio'

class ThreadTest < Minitest::Test
  def test_thread_unsafe_variable_count
    results = run_many_times './lib/thread/thread_unsafe_variable_count.rb'
    assert_equal true, results.include?('1')
    assert_equal true, results.include?('2')
  end

  def test_thread_safe_variable_count
    results = run_many_times './lib/thread/thread_safe_variable_count.rb'
    assert_equal false, results.include?('1')
    assert_equal true, results.include?('2')
  end

  def test_thread_unsafe_instance_variable_count
    results = run_many_times './lib/thread/thread_unsafe_instance_variable_count.rb'
    assert_equal true, results.include?('1')
    assert_equal true, results.include?('2')
  end

  def test_thread_unsafe_class_variable_count
    results = run_many_times './lib/thread/thread_unsafe_class_variable_count.rb'
    assert_equal true, results.include?('1')
    assert_equal true, results.include?('2')
  end

  private

  def run_many_times(file_name)
    $stdout = StringIO.new

    100.times do
      load file_name
    end

    out = $stdout.string

    $stdout = STDOUT

    out.each_line(chomp: true)
  end
end
