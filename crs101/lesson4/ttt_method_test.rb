require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

board = {1=>"X", 2=>"X", 3=>" ", 4=>"O", 5=>" ", 6=>"O", 7=>" ", 8=>" ", 9=>" "}

def id_decisive_lines(brd)
  decisive = []
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(PLAYER_MARKER) == 2 || brd.values_at(*line).count(COMPUTER_MARKER) == 2) && brd.values_at(*line).count(INITIAL_MARKER) == 1
      decisive.push line
    end
  end
  return decisive
end

def computer_places_piece!(brd, decisive_lines) # as written, it places piece at 1st decisive spot encountered --no priority given to offensive move
  decisive_lines.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      square = brd.key(INITIAL_MARKER)
      brd[square] = COMPUTER_MARKER
      break
    end
  break
  end
  decisive_lines.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = brd.key(INITIAL_MARKER)
      brd[square] = COMPUTER_MARKER
      break
    end
  break
  end
  # brd[5] = COMPUTER_MARKER if brd[5] == INITIAL_MARKER

  # square = empty_squares(brd).sample
  #brd[square] = COMPUTER_MARKER
end

decisive_lines = id_decisive_lines(board)

p decisive_lines
binding.pry
computer_places_piece!(board, decisive_lines)
binding.pry
p board
