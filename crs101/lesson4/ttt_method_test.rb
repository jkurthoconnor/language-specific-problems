require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

board = {1=>"X", 2=>" ", 3=>" ", 4=>"O", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>"O"}

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def id_decisive_line(brd) # return (as array) first winning line if present or first blocking line if no win is present or nil if none of above
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

def computer_places_piece!(brd) # appears to work.  needs more testing
  if !id_decisive_line(brd) && brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  elsif !id_decisive_line(brd)
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  elsif id_decisive_line(brd)
    square = id_decisive_line(brd).select { |num| brd[num] == INITIAL_MARKER }[0]
    brd[square] = COMPUTER_MARKER
  end
end

decisive_line = id_decisive_line(board)
p decisive_line
binding.pry
computer_places_piece!(board)
binding.pry
p board
