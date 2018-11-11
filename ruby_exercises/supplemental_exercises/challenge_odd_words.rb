# char set: letters, a space, a point
# words: 1..20 letters
# input text: 1 or more words, separated by 1 or more spaces, terminated by 0 or more spaces followed by a point
  # read input from first letter up to / including terminating point
# output text: 
  # successive words separated by 1 space; last word terminated by 1 point
  # odd words appear in reverse
  # even words are echoed

def odd_words(input_string)
  input_validator(input_string)

  words = input_string.delete('.').split

  output = words.map.with_index do |word, ind|
    ind.even? ? word : word.reverse
  end

  output.join(' ') << '.'
end

# BONUS version:
def odd_words_read_char_by_char(string)
  input_validator(string)

  count, index = [0, 0]
  return_str, holder = ['', [] ]

  while index < string.size
    if string[index, 2] =~ /\s\b/
      holder.push(string[index])
      count += 1
      return_str << holder.join
      holder = []
    elsif string[index] =~ /\./
      holder.push(string[index])
      return_str << holder.join
    elsif count.even? && string[index] =~ /\S/
      return_str << string[index]
    elsif count.odd? && string[index] =~ /\S/
      holder.unshift(string[index])
    end

    index += 1
  end
  return_str
end

def input_validator(string)
  unless string.count('.') == 1 &&
         string.count('A-Za-z') > 0 &&
         string == string.delete('^ .A-Za-z') &&
         string[-1] == '.' &&
         string[0] != ' ' &&
         string.split.none? { |word| word.size > 20 }
    raise "InvalidInput!"
  end
end

p odd_words('whats the matter with kansas.')
p odd_words('whatsth emat.')
p odd_words('whats the   matter with kansas.')
p odd_words('whatsth emat   .')
p odd_words_read_char_by_char('whats the matter with kansas.')
p odd_words_read_char_by_char('whatsth emat.')
p odd_words_read_char_by_char('whats the   matter with kansas.')
p odd_words_read_char_by_char('whatsth emat   .')
  