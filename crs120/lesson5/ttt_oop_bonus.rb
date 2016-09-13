require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    (1..9).select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def marks_on_line(line_array)
    marks = []
    line_array.each do |key|
      marks.push(@squares[key].to_s)
    end
    marks
  end

  def detect_winner
    WINNING_LINES.each do |line|
      marks = marks_on_line(line)
      return marks[0] if marks.uniq.size == 1 && marks[0] != ' '
    end
    nil
  end

  def someone_won_round?
    !!detect_winner
  end
end

class Square
  INITIAL_MARKER = " ".freeze

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
  attr_accessor :name
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X".freeze
  COMPUTER_MARKER = "O".freeze
  FIRST_MOVE = HUMAN_MARKER

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_move = FIRST_MOVE
    @score = [0, 0] # [human score, computer score]
  end

  def play
    setup_sequence
    loop do
      loop do
        display_board

        loop do
          current_player_moves
          break if board.someone_won_round? || board.full?
          clear_screen_and_display_board
        end

        display_round_result
        increment_score
        break if someone_won_game?
        reset_round
      end

      display_game_result
      break unless play_again?
      display_play_again_message
      reset_game
    end
    display_goodbye_message
  end

  private

  attr_reader :human, :computer
  attr_accessor :board, :current_move, :score

  def setup_sequence
    clear
    puts "\nWelcome to Tick, Tack, Toe."
    set_names
    display_matchup

    # add marker customization
    # if customize_marker?
    # set_marker
    # end
  end

  def set_names
    set_human_name
    set_computer_name
  end

  def set_human_name
    puts "\nPlease enter your name."
    name_choice = nil
    loop do
      name_choice = gets.chomp
      break if !name_choice.delete(' ').empty?
      puts "\nI'm sorry.  I can't use that as a player name. " \
           "Try again."
    end
    human.name = name_choice
  end

  def set_computer_name
    computer.name = ['R2D2', 'BB8', 'C3PO'].sample
  end

  def display_matchup
    puts "\n#{human.name}, you will be playing #{computer.name}"
  end

  # def customize_marker?
  #   opt_to_change = nil
  #   puts "\nYour default marker is '#{HUMAN_MARKER}'.  Would you like " +
  #   "to change it? ('y' or 'n')."
  #   loop do
  #     opt_to_change = gets.chomp.downcase
  #     break if ['y', 'n'].include?(opt_to_change)
  #     puts "That is not an option. (Type 'y' or 'n')."
  #   end
  #
  #   return false if opt_to_change == 'n'
  #   return true if opt_to_change == 'y'
  # end
  #
  # def set_marker
  #
  # end
  #

  def clear
    system 'clear' or system 'cls'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "\n#{human.name}'s Mark: '#{HUMAN_MARKER}'    " \
         "#{computer.name}'s Mark: '#{COMPUTER_MARKER}'"
    puts "\n#{human.name}'s Score: #{score[0]}    " \
         "#{computer.name}'s Score: #{score[1]}"
    puts "(The first to 5 wins the game.)"
    puts ""
    board.draw
  end

  def current_player_moves
    if current_move == HUMAN_MARKER
      human_moves
      self.current_move = COMPUTER_MARKER
    else
      computer_moves
      self.current_move = HUMAN_MARKER
    end
  end

  def option_joiner(array, spacer=', ', word='or')
    return array[0] if array.size == 1
    array.join(spacer).insert(-2, word + ' ')
  end

  def human_moves
    puts "\nSelect a square: #{option_joiner(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "\nThat is not a valid square."
      puts "Select from these options: #{option_joiner(board.unmarked_keys)}"
    end
    board[square] = human.marker
  end

  def identify_strategic_computer_move
    options = board.unmarked_keys
    [COMPUTER_MARKER, HUMAN_MARKER].each do |m|
      Board::WINNING_LINES.each do |line|
        marks = board.marks_on_line(line)
        next if marks.count(Square::INITIAL_MARKER).zero? ||
                marks.count(m) != 2
        line.each do |square_key|
          return square_key if options.include?(square_key)
        end
      end
    end
    return 5 if options.include?(5)
    nil
  end

  def computer_moves
    best_move_key = identify_strategic_computer_move
    if best_move_key.nil?
      board[board.unmarked_keys.sample] = computer.marker
    else
      board[best_move_key] = computer.marker
    end
  end

  def display_round_result
    clear_screen_and_display_board

    if board.detect_winner == HUMAN_MARKER
      puts "\n#{human.name}, you won this round!"
    elsif board.detect_winner == COMPUTER_MARKER
      puts "\nYou lost this round, #{human.name}."
    else
      puts "\nLooks like the round's a tie."
    end

    sleep 1.5
  end

  def increment_score
    score[0] += 1 if board.detect_winner == HUMAN_MARKER
    score[1] += 1 if board.detect_winner == COMPUTER_MARKER
  end

  def someone_won_game?
    score[0] == 5 || score[1] == 5
  end

  def display_game_result
    clear_screen_and_display_board
    case score.index(5)
    when 0
      puts "\nCongratulations #{human.name}.  You're the first to five." \
           "  You've won the game!"
    when 1
      puts "\nI'm sorry #{human.name}.  You've lost the game."
    end
  end

  def play_again?
    puts "\nWould you like to play again? (Enter 'y' or 'n'.)"
    choice = gets.chomp
    loop do
      break if ['y', 'n'].include?(choice.downcase)
      puts "Entering '#{choice}' is not an option.  Please enter 'y' or 'n'."
      choice = gets.chomp
    end
    return false if choice == 'n'
    true
  end

  def reset_round
    clear
    self.board = Board.new
    self.current_move = FIRST_MOVE
  end

  def reset_game
    reset_round
    self.score = [0, 0]
  end

  def display_play_again_message
    puts "\nExcellent! Here we go..."
    sleep 1.5
  end

  def display_goodbye_message
    clear
    puts "\nNice game #{human.name}.  Goodbye!"
    puts ""
  end
end

game = TTTGame.new
game.play
