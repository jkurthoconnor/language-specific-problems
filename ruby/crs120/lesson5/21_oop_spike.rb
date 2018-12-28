# game description and basic organization from [Launch School](https://launchschool.com/lessons/97babc46/assignments/819bf113)

# Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.
# 
# Here is an overview of the game:
# - Both participants dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. If he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, then the highest total wins.
# - If both totals are equal, then it's a tie, and nobody wins.

# Nouns: card, deck, participant(s), player, dealer, game, total

# Verbs: deal, hit, stay, (calculate total), bust

class Participant
end

class Player
  def initialize
    # what states apply to being a player?
  end

  def hit
  end
  
  def stay
  end
  
  def busted?
  end
  
  def total
    # related to cards
  end
end

class Dealer
  def initialize
    # what states apply to being a dealer?
  end

  def hit
  end

  def stay
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
    # what are states of being a card?
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