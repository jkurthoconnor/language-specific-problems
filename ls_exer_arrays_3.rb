#prints "example" from array three ways
arr = [["test", "hello", "world"],["example", "mem"]]

puts arr.flatten[3]

b = arr[1]
puts b[0]

c = arr.flatten
c.each do |str|
  if /exa/.match(str)
    puts str
  end
end
