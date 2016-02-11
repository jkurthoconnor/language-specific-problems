

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

demo_grams = []
none_grams = []
tied_grams = []
evil_grams = []
flow_grams = []
words.each do |word|
 if (/d/.match(word)) && !(/i/.match(word))
   demo_grams.push(word)
 end
 if (/n/.match(word))
   none_grams.push(word)
 end
 if (/t/.match(word))
   tied_grams.push(word)
 end
 if (/v/.match(word))
   evil_grams.push(word)
 end
 if (/f/.match(word))
   flow_grams.push(word)
 end
end
puts "Anagram set 1: #{demo_grams}"
puts "Anagram set 2: #{none_grams}"
puts "Anagram set 3: #{tied_grams}"
puts "Anagram set 4: #{evil_grams}"
puts "Anagram set 5: #{flow_grams}"
