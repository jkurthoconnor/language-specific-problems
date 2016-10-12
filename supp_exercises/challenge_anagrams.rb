# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

class Anagram
  def initialize(word)
    @word = word
  end

  def match(possibilities)
    # checks `possibilities` against `@word` and returns all and only those elements in `possibilities` that are anagrams of `@word`.  a `select` like function
  end
end