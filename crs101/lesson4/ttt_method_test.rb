require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

board = {1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def id_decisive_line(brd) # return first winning line array if present or first block array if no win is present or nil if none of above
  block = []
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(COMPUTER_MARKER) == 2) && brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line
    elsif (brd.values_at(*line).count(PLAYER_MARKER) == 2) && brd.values_at(*line).count(INITIAL_MARKER) == 1
      block.push line
    end
    binding.pry
  end
  block[0]
end

def computer_places_piece!(brd) # so far, takes next best option if no decisive line
  if !id_decisive_line(brd) && brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  elsif !id_decisive_line(brd)
      square = empty_squares(brd).sample
      brd[square] = COMPUTER_MARKER
  end

  # id_decisive_line(brd).each do |line|
  #   if brd.values_at(*line).count(COMPUTER_MARKER) == 2
  #     square = line.select { |i| brd.values_at(i) == INITIAL_MARKER }
  #     # nb the line returned is the full array of, e.g [4, 5, 6];
  #     # `brd.key(INITIAL_MARKER)` returns the key of an INITIAL_MARKER in brd, so how do I select which index in line correlates to the key?
  #     # iterate over each item in array; for each check if it is a key of an INITIAL_MARKER in brd.  If it is, make that index the value for `square` and break
  #     brd[square] = COMPUTER_MARKER
  #     break
  #   end
  # end

  # id_decisive_lines(brd).each do |line| # as written, it places piece at 1st INITIAL_MARKER spot encountered
  #   if brd.values_at(*line).count(PLAYER_MARKER) == 2
  #     square = brd.key(INITIAL_MARKER)
  #     brd[square] = COMPUTER_MARKER
  #     break
  #   end
  # end

  # brd[5] = COMPUTER_MARKER if brd[5] == INITIAL_MARKER
  #
  # square = empty_squares(brd).sample
  # brd[square] = COMPUTER_MARKER
end

decisive_line = id_decisive_line(board)
p decisive_line
binding.pry
computer_places_piece!(board)
binding.pry
p board




=begin
# another possibility: have best_next_move return the winning line (if present) or the blocking line
#basically run through possibilities and if it identifies a winning line return it; if no winning lines are available, return blocking lines, if none available, return square 5 (if empty); if none above, sample of empty

def best_next_move(brd) # RETURN best square for computerby board key
  blocking_lines = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
      best = line.select { |n| brd[:n] == INITIAL_MARKER }
      break
    elsif brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
      blocking_lines.push line
    end
  end
  # if blocking_lines.empty? && brd[:5] == INITIAL_MARKER

end

p best_next_move(board)

=end


# def id_decisive_lines(brd)  ## works!
#   decisive = []
#   WINNING_LINES.each do |line|
#     if (brd.values_at(*line).count(PLAYER_MARKER) == 2 || brd.values_at(*line).count(COMPUTER_MARKER) == 2) && brd.values_at(*line).count(INITIAL_MARKER) == 1
#       decisive.push line
#     end
#   end
#   return decisive
# end
