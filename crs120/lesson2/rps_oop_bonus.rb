class Move
  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(value)
    @value = value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end

  protected

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    self.score = 0
    self.move_history = []
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Please enter your name."
      n = gets.chomp
      break unless n.empty?
      puts "You must enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "\nPlease choose a move: rock, paper, or scissors."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "'#{choice}' is not a valid option."
    end
    self.move = Move.new(choice)
    move_history.push(move)
  end
end

class Computer < Player
  def set_name
    self.name = ['Data', 'C3PO', 'BB8', 'R2D2'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    move_history.push(move)
  end
end

class RPSGame
  attr_accessor :human, :computer, :win_level

  def initialize
    @human = Human.new
    @computer = Computer.new
    @win_level = set_win_level
  end

  def set_win_level
    wins = nil
    puts "How many wins should it take to win the game?"
    loop do
      wins = gets.chomp.to_i
      break if wins != 0
      puts "That is not a valid entry."
    end
    wins
  end

  def display_welcome
    system 'clear' or system 'cls'
    puts "\nHello, #{human.name}.  Welcome to Rock, Paper, Scissors."
    puts "\nYour opponent today is #{computer.name}."
    sleep 2.0
  end

  def display_goodbye
    puts "\nNice game, #{human.name}!  Good bye."
  end

  def display_moves
    puts "\nYou chose #{human.move}. #{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      puts "You won!"
      human.score += 1
    elsif human.move < computer.move
      puts "You loose :-( "
      computer.score += 1
    else
      puts "It's a tie."
    end
    sleep 2.0
  end

  def display_header
    system 'clear' or system 'cls'
    puts "Rock, Paper, Scissors"
    puts "\nScore: #{human.name}: #{human.score} || #{computer.name}:  #{computer.score}."
    puts "The first to win #{win_level} rounds wins the game."
    puts "\n#{human.name}'s past moves:"
    p human.move_history.map(&:to_s)
    puts "\n#{computer.name}'s past moves:"
    p computer.move_history.map(&:to_s)
  end

  def game_winner?
    human.score == win_level || computer.score == win_level
  end

  def display_game_winner
    if human.score == win_level
      puts "\nCongratulations #{human.name}.  You have won the game!"
    else
      puts "\nSorry, #{human.name}.  #{computer.name} beat you."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like a rematch?  Enter 'y' or 'n'."
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "'#{answer}' is an invalid entry."
    end

    return false if answer == 'n'
    return true if answer == 'y'
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play
    loop do
      display_welcome

      loop do
        display_header
        human.choose
        computer.choose
        display_header
        display_moves
        display_round_winner
        break if game_winner?
      end

      display_header
      display_game_winner
      reset_score
      break unless play_again?
    end

    display_goodbye
  end
end

RPSGame.new.play
