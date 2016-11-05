# class facilitates calculating Hamming Difference between two DNA strands;
# handles input of strands of differing length
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
      return distance if ind >= end_point
    end
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
