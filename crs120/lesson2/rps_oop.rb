# architecture and implementation modelled off of Launch School tutorial

class Move
  VALUES = ['rock', 'paper', 'scissors']
  
  def initialize(value)
    @value = value
  end
  
  def rock?
    @value == 'rock'
  end
  
  def paper?
    @value == 'paper'
  end
  
  def scissors?
    @value == 'scissors'
  end
  
  def >(other_move)
    if rock?
      return true if other_move.scissors?
      return false 
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end
    
  def <(other_move)
    if rock?
      return true if other_move.paper?
      return false 
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
  end
  
  def to_s
    @value
  end
end


class Player
  attr_accessor :move, :name
  
  def initialize
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


class Rule
  def initialize
    # what is the state of a rule object?
  end
end

# where should 'compare' go?
def compare(move1, move2)
  
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new 
    @computer = Computer.new
  end
  
  def display_welcome
    puts "Welcome to Rock, Paper, Scissors.  Good luck, #{human.name}.  (You'll need it.)"
  end
  
  def display_goodbye
    puts "Nice game, #{human.name}!  Good Bye."
  end
  
  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    
    if human.move > computer.move
      puts "You won!"
    elsif human.move < computer.move
      puts "You loose :-( "
    else 
      puts "It's a tie."
    end
    
    # case human.move
    # when 'rock'
    #   puts "You won!" if computer.move == 'scissors'
    #   puts "It's a tie." if computer.move == 'rock'
    #   puts "You loose :-( " if computer.move == 'paper'
    # when 'paper'
    #   puts "You won!" if computer.move == 'rock'
    #   puts "It's a tie." if computer.move == 'paper'
    #   puts "You loose :-( " if computer.move == 'scissors'
    # when 'scissors'
    #   puts "You won!" if computer.move == 'paper'
    #   puts "It's a tie." if computer.move == 'scissors'
    #   puts "You loose :-( " if computer.move == 'rock'
    # end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like a rematch?  Enter 'y' or 'n'."
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "'#{answer}' is an invalid entry."
    end
    
    return true if answer == 'y'
    return false
  end
  
  def play
    display_welcome
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye
  end
end

RPSGame.new.play