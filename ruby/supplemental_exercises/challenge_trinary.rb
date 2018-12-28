
class Trinary
  def initialize(string)
    @trinary_dig = clean_and_convert(string)
  end

  def clean_and_convert(string)
    return string.chars.map(&:to_i) unless string.match(/[^012]/)
    string = [0]
  end

  def to_decimal
    n = @trinary_dig.length - 1
    @trinary_dig.map.with_index { |digit, index| digit*3**(n - index) }.reduce(&:+)
  end
end

# zero = Trinary.new('0')
# p zero.to_decimal