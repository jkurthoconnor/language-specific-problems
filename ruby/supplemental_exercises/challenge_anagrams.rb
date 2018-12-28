# class to select a given string's anagrams from a list.
class Anagram
  def initialize(word)
    @word = word.downcase
    @ordered_chars = @word.chars.sort
  end

  def match(list)
    list.select do |candidate|
      candidate.casecmp(@word) != 0 &&
        candidate.downcase.chars.sort == @ordered_chars
    end
  end
end
