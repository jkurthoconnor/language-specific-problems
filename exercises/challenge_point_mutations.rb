# class facilitates calculating Hamming Difference between two DNA strands;
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    ind = 0
    distance = 0
    end_point = [@strand.size, other_strand.size].min

    return 'Invalid strand.' unless valid_strands?(other_strand)

    loop do
      distance += 1 if @strand[ind] != other_strand[ind]
      ind += 1
      return distance if ind >= end_point
    end
  end

  private

  def valid_strands?(cf_strand)
    cf_strand =~ /^[A-Z]*$/ && @strand =~ /^[A-Z]*$/
  end
end
