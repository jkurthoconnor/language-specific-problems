
class Participant
  def initialize
    # what states apply to both player and dealer?
      # both have hands composed of cards (collaborator objects)
      # both will have names
      @name = set_name
  end

  def hit
  end
  
  def stay
  end
end

class Player < Participant
  def initialize
    # what states uniquely apply to player? total? ...well each will have a card total, but that could be handled by Participant
  end

  def busted?
  end
  
  def total
    # related to cards
  end
end

class Dealer < Participant
  def initialize
    # what states apply to being a dealer?
  end


  def busted?
  end

  def total
    # related to cards
  end
  
  def deal (?)
  end
end

class Deck
  def initialize
    # need some data structure for cards (collaborators)
  end

  def deal (?)
  end
end

class Card
  def initialize
    # what are states of being a card? number, value, suit
  end
end

class Game
  def play
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.play