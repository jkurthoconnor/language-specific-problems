require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  attr_reader :text, :string

  def setup
    @string = File.open('sample2.txt', 'r') do |str|
      str.read
    end
    @text = Text.new(string)
  end

  def test_swap
    expected_string = string.gsub('a', 'e')
    assert_equal(expected_string, text.swap('a', 'e'))
  end
end