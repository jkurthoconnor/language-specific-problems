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
  INITIAL_MARKER = " "
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
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
end


class Square
  attr_accessor :marker
  
  def initialize(marker)
    @marker = marker
  end
  
  def to_s
    @marker
  end
  
  def unmarked?
    marker == Board::INITIAL_MARKER
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
  end
  
  def display_goodbye_message
    puts "Nice game.  Goodbye!"
  end
  
  def display_board
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
  
  def play
    display_welcome_message
    display_board 

    loop do
      human_moves
      break if board.full? # || someone_won?

      computer_moves
      break if board.full? # || someone_won? 

      display_board
    end

    # display_result
    display_goodbye_message
  end
end


game = TTTGame.new
game.play