# Write a program that can calculate the Hamming difference between two DNA strands.
# ...
# 
# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.
# 
# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.
# 
# This is called the 'Hamming distance'
# 
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.
# 
# The Hamming distance is only defined for sequences of equal length. Hence you may assume that only sequences of equal length will be passed to your hamming distance function.

# input: two upcased alpha strings of equal length; no spaces
# 
# count and return the number of points of difference
  # point of difference: point (index?) at which the strings' content !=
  # edge cases: when string length differs, ignore all points on longer string beyond shared length
# output: integer representing the number of points of difference between strings

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    ind = 0
    distance = 0
    while ind < strand.length
      distance += 1 if strand[ind] != other_strand[ind]
      ind += 1
    end
    distance
  end

  protected

  attr_reader :strand
end