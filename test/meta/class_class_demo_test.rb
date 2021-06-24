require 'minitest/autorun'
require 'stringio'

class ClassClassDemoTest < Minitest::Test
  def setup
    $stdout = StringIO.new
  end

  def test_class_class_demo
    load './lib/meta/class_class_demo.rb'

    expected = <<~EOT
      1
      Alice
      2
      Bob
      hoge
      fuga
      piyo
    EOT

    assert_equal expected, $stdout.string
  end

  def teardown
    $stdout = STDOUT
  end
end
