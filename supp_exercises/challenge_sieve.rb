# Challenges: [Easy 1: Sieve of Eratosthenes](https://launchschool.com/exercises/ca16ce9f)

# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.
# 
# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.
# 
# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).
# 
# The algorithm consists of repeating the following over and over:
# 
# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime.

class Sieve
  def initialize(limit)
    @up_to = limit
  end

  def primes
    composite = []
    range = (2..@up_to).to_a
    unmarked = range
    index = 0

    while index < unmarked.length
      unmarked.each do |n|
        next if n == unmarked[index]
        composite.push(n) if n % unmarked[index] == 0
      end
      unmarked = range - composite
      index += 1
    end

    unmarked
  end
end

check_to_ten = Sieve.new(10)
p check_to_ten.primes
check_to_hundred = Sieve.new(100)
p check_to_hundred.primes
