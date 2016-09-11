# code based on Launch School 'walkthrough' of Tick Tack Toe

# Nouns: board, player, square, grid
# Verbs: play, mark

# Board
# Square
# Player
# - mark
# - play
require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new}
  end
  
  def get_square_at(key)
    @squares[key]
  end
  
  def set_square_at(key, marker)
    @squares[key].marker = marker
  end
  
  def unmarked_keys
    (1..9).select {|key| @squares[key].unmarked?}
  end
  
  def full?
    unmarked_keys.length.zero?
  end
  
  def someone_won?
    !!detect_winner
  end
  #returns winning marker or nil
  def detect_winner
    WINNING_LINES.each do |line|
      line_marks = []
      line.each do |key|
        line_marks.push(@squares[key].to_s)
      end
      return TTTGame::HUMAN_MARKER if line_marks.uniq == [TTTGame::HUMAN_MARKER]
      return TTTGame::COMPUTER_MARKER if line_marks.uniq == [TTTGame::COMPUTER_MARKER]
    end
    nil
  end
end


class Square
  INITIAL_MARKER = " "

  attr_accessor :marker
  
  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end
  
  def to_s
    @marker
  end
  
  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  
  def initialize(marker)
    @marker = marker
  end
end 


class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  
  attr_reader :board, :human, :computer
  
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end
  
  def display_welcome_message
    puts "Welcome to Tick, Tack, Toe."
    puts ""
    puts "Your mark is #{HUMAN_MARKER} .  The computer's mark is #{COMPUTER_MARKER}"
    sleep 2.0
  end
  
  def display_goodbye_message
    puts "Nice game.  Goodbye!"
  end
  
  def display_board
    system 'clear' or system 'cls'
    puts "You: '#{HUMAN_MARKER}'  || Computer: '#{COMPUTER_MARKER}'"
    puts ""
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def human_moves
    puts "Select a square: #{board.unmarked_keys}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Please select from these options: #{board.unmarked_keys}"
    end
    board.set_square_at(square, human.marker)
  end
  
  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    display_board
    puts ""
    puts "The board is full." if board.full?
    puts "Congratulations. You won!" if board.detect_winner == HUMAN_MARKER
    puts "I'm sorry. You have lost." if board.detect_winner == COMPUTER_MARKER
  end
  
  def play
    display_welcome_message
    display_board 

    loop do
      human_moves
      break if board.someone_won? || board.full?

      computer_moves
      break if board.someone_won? || board.full?

      display_board
    end

    display_result
    display_goodbye_message
  end
end


game = TTTGame.new
game.play