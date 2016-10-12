
class SumOfMultiples
  @@default = [3, 5]

  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(limit)
    multiples = (0...limit).select do |mult|
      (mult % @@default[0]).zero? || (mult % @@default[1]).zero?
    end

    multiples.reduce(&:+)
  end

  def to(limit)
    multiples = []
    (0...limit).each do |mult|
      @numbers.each { |n| multiples.push(mult) if (mult % n).zero? }
    end

    multiples.uniq.reduce(&:+)
  end
end

eg = SumOfMultiples.new(3, 4, 5)
p eg
p SumOfMultiples.new(7, 13, 17).to(20)
p SumOfMultiples.new(4, 6).to(15)
