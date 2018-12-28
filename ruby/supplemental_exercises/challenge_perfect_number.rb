# class facilitates identification of perfect, deficient, and abundant numbers
# per Nicomachus' classification
class PerfectNumber
  def self.classify(n)
    raise(RuntimeError, 'No Aliquot sum for n < 2') if n <= 1

    result = factor(n).reduce(&:+) <=> n
    case result
    when 0  then 'perfect'
    when -1 then 'deficient'
    when 1  then 'abundant'
    end
  end

  def self.factor(n)
    (1..(n / 2)).select { |fac| (n % fac).zero? }
  end
end
