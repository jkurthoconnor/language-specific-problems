# generates lyrics to 'Bottles of Beer'
class BeerSong
  def initialize
    @lyrics = ''
  end

  def verse(v_number)
    generate_verses(v_number)

    if v_number > 0
      @lyrics << "#{@part_1}#{@part_2}"
    else
      @lyrics << "#{@part_1}#{@conclusion}"
    end

    @lyrics
  end

  def generate_verses(v_number)
    @part_1 = "#{eval_bottles(v_number).capitalize} of beer on the wall," \
    " #{eval_bottles(v_number)} of beer.\n"
    @part_2 = "Take #{eval_pronoun(v_number)} down and pass it around," \
    " #{eval_bottles(v_number - 1)} of beer on the wall.\n"
    @conclusion = 'Go to the store and buy some more,' \
    " 99 bottles of beer on the wall.\n"
  end

  def verses(verse1, verse2)
    verse1.downto(verse2) do |n|
      verse(n)
      @lyrics << "\n" unless n == verse2
    end
    @lyrics
  end

  def eval_bottles(number)
    case number
    when (2..99) then "#{number} bottles"
    when 1       then "#{number} bottle"
    when 0       then 'no more bottles'
    end
  end

  def eval_pronoun(number)
    number > 1 ? 'one' : 'it'
  end

  def lyrics
    verses(99, 0)
  end
end
