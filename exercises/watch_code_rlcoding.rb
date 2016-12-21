
def rl_encode(data_string)
  run_char = data_string[0]
  count = 0

  encoded = data_string.chars.each_with_object('') do |curr_char, rle|
    if curr_char == run_char
      count += 1
    else
      count > 1 ? rle << "#{count}#{run_char}" : rle << run_char
      run_char = curr_char
      count = 1
    end
  end

  count > 1 ? encoded << "#{count}#{run_char}" : encoded << run_char
end


def rl_decode(encoded_str)
  digits = ''

  encoded_str.chars.each_with_object('') do |char, decoded|
    if char =~ /\d/
      digits << char
    elsif digits.to_i > 0
      decoded << (char * digits.to_i)
      digits = ''
    else
      decoded << char
      digits = ''
    end
  end
end


p rl_encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB') == '12WB12W3B24WB'
p rl_encode('LLLLLLLLLLLLLDDDNLLLLLLLLLLLDDDCCCC') == '13L3DN11L3D4C'

p rl_decode('12WB12W3B24WB') == 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
p rl_decode('13L3DN11L3D4C') == 'LLLLLLLLLLLLLDDDNLLLLLLLLLLLDDDCCCC'
