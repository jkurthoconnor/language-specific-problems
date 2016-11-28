# Write a program that, given a word, computes the scrabble score for that word.
# 
# Letter Values
#  
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
#

class Scrabble
  def initialize(string)
    @string = string
    @points = 0
  end

  def valid_input?
     @string.is_a?(String) &&
     @string =~ /\A[a-z]+\z/i
  end

  def score
    return @points unless valid_input?
    @string.upcase.each_char do |char|
      @points += look_up_points(char)
    end

    @points
  end
  
  def self.score(string)
    Scrabble.new(string).score
  end

  def look_up_points(char)
    if ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].include?(char)
      1
    elsif ['D', 'G'].include?(char)
      2
    elsif ['B', 'C', 'M', 'P'].include?(char)
      3
    elsif ['F', 'H', 'V', 'W', 'Y'].include?(char)
      4
    elsif ['K'].include?(char)
      5
    elsif ['J', 'X'].include?(char)
      8
    elsif ['Q', 'Z'].include?(char)
      10
    end
  end
end