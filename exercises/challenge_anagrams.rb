# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

class Anagram
  def initialize(word)
    @word = word
  end

  def match(possibilities)
    sorted_chars = @word.downcase.chars.sort

    possibilities.delete_if { |poss| poss.downcase == @word.downcase }

    possibilities.select do |ana|
      ana.downcase.chars.sort == sorted_chars
    end
  end
end