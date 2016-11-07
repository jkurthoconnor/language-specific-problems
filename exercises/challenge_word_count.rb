
class Phrase
  attr_accessor :phrase, :count

  def initialize(string)
    @phrase = string
  end

  def word_count
    @count = Hash.new(0)
    words = clean_string
    words.each { |word| count[word] += 1 }
    count
  end

  def clean_string # consolidate regex
    words = phrase.downcase.gsub(',', ' ').delete("^ 'a-z0-9")
    words.gsub(/ '/, ' ').gsub(/' /, ' ').split
  end
end

