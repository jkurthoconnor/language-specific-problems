
require 'pry'
class BeerSong
  def initialize
    @lyrics = ''
  end

  def verse(verse)
    if verse > 0
      @lyrics << "#{eval_bottles(verse).capitalize} of beer on the wall, #{eval_bottles(verse)} of beer.\n" \
       "Take #{eval_pronoun(verse)} down and pass it around, #{eval_bottles(verse - 1)} of beer on the wall.\n"
     else
       @lyrics << "#{eval_bottles(verse).capitalize} of beer on the wall, #{eval_bottles(verse)} of beer.\n" \
       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
     end

     @lyrics
  end

  def verses(verse1, verse2)
    (verse1).downto(verse2) do |n|
      verse(n)
      @lyrics << "\n" unless n == verse2
     end
    #  binding.pry
     @lyrics
  end

  def eval_bottles(number)
    case
    when number > 1     then "#{number} bottles"
    when number == 1    then "#{number} bottle"
    when number == 0    then  "no more bottles"
    end
  end

  def eval_pronoun(number)
    if number > 1
      then "one"
    else
      "it"
    end
  end

  def lyrics
    verses(99, 0)
  end
end
