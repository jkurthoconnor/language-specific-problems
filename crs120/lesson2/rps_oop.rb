# architecture and implementation modelled off of Launch School tutorial
# nouns: player; move; rule
# verbs: choose, compare

class Player
  attr_accessor :move
  
  def initialize(player_type = :human) # default player type set; computer must pass in argument at init
    @player_type = player_type
    @move = nil
  end
  
  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose a move: rock, paper, or scissors."
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "'#{choice}' is not a valid option."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample  
    end
  end
  
  def human?
    @player_type == :human
  end
end

class Human < Player
  def initialize
    
  end
  
  def choose
    
  end
  
end

class Move
  def initialize
    # must keep track of choice; move objects: rock, paper, scissors?
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
    @human = Player.new 
    @computer = Player.new(:computer)# argument passed is to be used internally by Player class, so anything would work, so long as are consistent
  end
  
  def display_welcome
    puts "Welcome to Rock, Paper, Scissors.  Good luck.  (You'll need it.)"
  end
  
  def display_goodbye
    puts "Nice game!  Good Bye."
  end
  
  def display_winner
    puts "You chose #{human.move}."
    puts "The computer chose #{computer.move}."
    
    case human.move
    when 'rock'
      puts "You won!" if computer.move == 'scissors'
      puts "It's a tie." if computer.move == 'rock'
      puts "You loose :-( " if computer.move == 'paper'
    when 'paper'
      puts "You won!" if computer.move == 'rock'
      puts "It's a tie." if computer.move == 'paper'
      puts "You loose :-( " if computer.move == 'scissors'
    when 'scissors'
      puts "You won!" if computer.move == 'paper'
      puts "It's a tie." if computer.move == 'scissors'
      puts "You loose :-( " if computer.move == 'rock'
    end
  end
  
  def play
    display_welcome
    human.choose
    computer.choose
    display_winner
    display_goodbye
  end
end


RPSGame.new.play