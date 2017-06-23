# class facilitates counting words in a string
class Phrase
  def initialize(phrase)
    @words = phrase
  end

  def word_count
    count = {}

    clean_words.each do |word|
      count[word] ? count[word] += 1 : count[word] = 1
    end

    count
  end

  def clean_words
    @words.downcase.gsub(/([^a-z0-9'])/, ' ')
          .gsub(/'(\b[\w']+\b)'/, '\1').split
  end
end
