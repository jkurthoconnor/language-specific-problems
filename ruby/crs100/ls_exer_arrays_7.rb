arr = ['R', 2, 'D', 2, 'C', 3, 'PO', 'BB', 8]
puts "Here's the original array:"
p arr

new_arr = []

arr.each do |n|
  if /\d/.match(n.to_s)
    new_arr.push n
  end
end

new_arr.map! { |n| n += 1 }
puts "Here's the new filtered and incremented array:"
p new_arr
