
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    ind = 0
    distance = 0
    end_point = calc_end_point(other_strand)

    loop do
      distance += 1 if strand[ind] != other_strand[ind]
      ind += 1
      break if ind >= end_point
    end

    distance
  end
  
  def calc_end_point(other_strand)
    case strand.length <=> other_strand.length
    when 1 then other_strand.length
    else        strand.length
    end
  end

  protected

  attr_reader :strand
end

p DNA.new('').hamming_distance('')