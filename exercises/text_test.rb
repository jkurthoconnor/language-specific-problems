require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  attr_reader :text, :string

  def setup
    @file = File.open('sample2.txt', 'r')
    @string =  @file.read
    @text = Text.new(string)
  end

  def test_swap
    expected_string = string.gsub('a', 'e')
    assert_equal(expected_string, text.swap('a', 'e'))
  end
  
  def teardown
    @file.close
  end
end