# a class that creates a fizzbuzz response;  Yes, OO FizzBuzz is heavy-handed; had to try anyway!

class FizzBuzzer
  attr_reader :fizzbuzz

  def initialize(limit)
    @limit = limit
    @fizzbuzz = []
    generate_fizzbuzz
  end

  def generate_fizzbuzz
    (1..@limit).each do |n|
      if multiple_of_three?(n) && multiple_of_five?(n)
        @fizzbuzz << 'fizzbuzz'
      elsif multiple_of_three?(n)
        @fizzbuzz << 'fizz'
      elsif multiple_of_five?(n)
        @fizzbuzz << 'buzz' 
      else
        @fizzbuzz << n
      end
    end
  end

  def multiple_of_three?(number)
    (number % 3).zero?
  end

  def multiple_of_five?(number)
    (number % 5).zero?
  end
end

go = FizzBuzzer.new(100)
puts go.fizzbuzz