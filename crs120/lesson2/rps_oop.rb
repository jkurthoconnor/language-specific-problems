# architecture and implementation modelled off of Launch School tutorial
# nouns: player; move; rule
# verbs: choose, compare

class Player
  def initialize
    # a name? a move?
  end
  
  def choose
    
  end
end

class Move
  def initialize
    # must keep track of choice; move objects: rock, paper, scissors
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
    @computer = Player.new
  end
  
  def play
    display welcome
    human.choose
    computer.choose
    display_winner
    display_goodbye
  end
end

