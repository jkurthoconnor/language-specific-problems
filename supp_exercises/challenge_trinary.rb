
class Trinary
  def initialize(string)
    @trinary_dig = string.chars.map(&:to_i) # add validation / conversion
  end

  def to_decimal
    n = @trinary_dig.length - 1
    @trinary_dig.map.with_index { |digit, index| digit*3**(n - index) }.reduce(&:+)
  end
end
