class Move
  VALUES = ['rock', 'paper', 'scissors']

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
  attr_accessor :move, :name, :score

  def initialize
    self.score = 0
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
      puts "Please choose a move: rock, paper, or scissors."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "'#{choice}' is not a valid option."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Data', 'C3PO', 'BB8', 'R2D2'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome
    puts "Welcome to Rock, Paper, Scissors.  Good luck, #{human.name}.
      (You'll need it.)"
  end

  def display_goodbye
    puts "Nice game, #{human.name}!  Good Bye."
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner # break into calculate/record method and display method?
    if human.move > computer.move
      puts "You won!"
      human.score += 1
    elsif human.move < computer.move
      puts "You loose :-( "
      computer.score += 1
    else
      puts "It's a tie."
    end
    puts "#{human.name}'s score is: #{human.score}."
    puts "#{computer.name}'s score is: #{computer.score}."
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like a rematch?  Enter 'y' or 'n'."
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "'#{answer}' is an invalid entry."
    end

    return true if answer == 'y'
    return false if answer == 'n'
  end

  def play
    display_welcome
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye
  end
end

RPSGame.new.play