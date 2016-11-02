require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  attr_reader :text, :string

  def setup
    @file = File.open('sample2.txt', 'r')
    puts "File is now open for reading: {#@file.open?}"
    @string =  @file.read
    @text = Text.new(string)
  end

  def test_swap
    expected_string = string.gsub('a', 'e')
    assert_equal(expected_string, text.swap('a', 'e'))
  end
  
  def test_word_count
    expected_count = string.split.count
    assert_equal(expected_count, text.word_count)
  end

  def teardown
    @file.close
    puts "File is now closed: #{@file.closed?}"
  end
end

# def word_count
#   @text.split.count
# end