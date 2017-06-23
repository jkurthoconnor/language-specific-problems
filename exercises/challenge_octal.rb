# Challenges [Easy 1: Octal](https://launchschool.com/exercises/09b0d367)

# Implement octal to decimal conversion. Given an octal input string
# your program should produce a decimal output.

#   233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1

# Octal is similar, but uses powers of 8 rather than powers of 10. So:
#
#   233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

# class with method to convert octal string to decimal integer
class Octal
  def initialize(string)
    @octal = string
  end

  def to_decimal
    return 0 unless @octal =~ /^[0-7]+$/

    @octal.chars.reverse.map.with_index do |n, power|
      n.to_i * 8**power
    end.reduce(&:+)
  end
end
