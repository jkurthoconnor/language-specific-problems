# Write a program that given a phrase can count the occurrences of each word in that phrase.
# input: phrase string
# output: hash with unique words from phrase as keys, ordered as they appear in phrase; values are corresponding word counts

class Phrase
  attr_accessor :phrase, :count

  def initialize(string)
    @phrase = string.downcase.gsub(',', ' ').delete("^ 'a-z0-9").split
  end

  def word_count
    @count = Hash.new(0)
    phrase.each { |word| count[word] += 1 }
    count
  end
end

