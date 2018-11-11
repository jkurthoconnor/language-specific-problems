# class to calculate the sum of multiples of given numbers
# below specified limit.
class SumOfMultiples
  def initialize(*n)
    @factors = n
  end

  def self.to(limit)
    multiples = []
    [3, 5].each do |mult|
      multiples << (0...limit).select { |n| (n % mult).zero? }
    end

    multiples.flatten.uniq.reduce(&:+)
  end

  def to(limit)
    multiples = []
    @factors.each do |mult|
      multiples << (0...limit).select { |n| (n % mult).zero? }
    end

    multiples.flatten.uniq.reduce(&:+)
  end
end
