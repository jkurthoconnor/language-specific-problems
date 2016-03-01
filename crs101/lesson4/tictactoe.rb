INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end
# rubocop:disable Metrics/MethodLength, Metrics/AbcSize

def display_board(brd, score)
  system 'clear'
  puts "Welcome to Tic Tac Toe. The first player to win 5 rounds wins the game.\n(Player marks `#{PLAYER_MARKER}`. Computer marks `#{COMPUTER_MARKER}`)"
  puts ''
  puts "Player Score: #{score[:player]}   //   Computer Score: #{score[:computer]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joiner(brd, separator, conjunction)
  if empty_squares(brd).length > 1
    empty_squares(brd).join("#{separator} ").insert(-2, "#{conjunction} ")
  else
    empty_squares(brd).join
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joiner(brd, ',', 'or')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def id_decisive_line(brd)
  block = []
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(COMPUTER_MARKER) == 2) && brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line
    elsif (brd.values_at(*line).count(PLAYER_MARKER) == 2) && brd.values_at(*line).count(INITIAL_MARKER) == 1
      block.push line
    end
  end
  block[0]
end

def computer_places_piece!(brd)
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

def board_full?(brd)
  empty_squares(brd) == []
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_round_winner(brd)
end

def keep_score(result, score)
  if result == 'Player'
    score[:player] += 1
  elsif result == 'Computer'
    score[:computer] += 1
  end
end

def detect_game_winner(score)
  if score[:player] == 5
    return 'Player'
  elsif score[:computer] == 5
    return 'Computer'
  end
  nil
end

loop do
  scores = { player: 0, computer: 0 }

  loop do
    board = initialize_board
    display_board(board, scores)

    loop do
      player_places_piece!(board)
      display_board(board, scores)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      display_board(board, scores)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      prompt "#{detect_round_winner(board)} won the round"
    else
      prompt "This round's a tie."
    end

    sleep 1.0

    winner = detect_round_winner(board)
    keep_score(winner, scores)
    break if detect_game_winner(scores)
  end
  system 'clear'
  prompt "Final Score: Player #{scores[:player]}   //   Computer: #{scores[:computer]}"
  prompt "#{detect_game_winner(scores)} won the game!!"
  prompt "Would you like to play again? (Y or N)"
  answer = gets.chomp.downcase
  break unless answer.start_with? 'y'
end
prompt "That was fun. Good bye!"
