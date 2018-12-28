# Challenges: [Easy 1: Sieve of Eratosthenes](https://launchschool.com/exercises/ca16ce9f)

# Write a program that uses the Sieve of Eratosthenes to find all the primes
# from 2 up to a given number.
#
# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
# prime numbers up to any given limit. It does so by iteratively marking as
# composite (i.e. not prime) the multiples of each prime, starting with the
# multiples of 2.
#
# Create your range, starting at two and continuing up to and including
# the given limit. (i.e. [2, limit]).
#
# The algorithm consists of repeating the following over and over:
#
# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm
# terminates, all the numbers in the list that have not been marked are prime.

# class uses Sieve of Eratosthenes to generate primes up to a given limit
class Sieve
  def initialize(limit)
    @limit = limit
    @potentials = list_potential_primes
  end

  def primes
    (2..@limit).each do |n|
      next unless @potentials[n] == 'unchecked'
      @potentials[n] = 'prime'

      (n + 1..@limit).each do |k|
        @potentials[k] = 'composite' if (k % n).zero?
      end
    end
    @potentials.select { |_, v| v == 'prime' }.keys
  end

  private

  def list_potential_primes
    list = {}
    (2..@limit).each { |k| list[k] = 'unchecked' }
    list
  end
end
