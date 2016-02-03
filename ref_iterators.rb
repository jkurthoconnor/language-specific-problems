# iterators loop over a collection; use of iterators is preferred in Ruby over other loops

names = ['Tim', 'Lisa', 'Octacian', 'Louis']
x = 1
names.each { |name| puts name} #use {} when block fits on a line

names.each do |name| # use 'do' and 'end' when block is multi-line
  puts "#{x}. #{name}"
  x += 1
end
#from my answer to exercises
movies = {:Flick => 1934, :Film => 1976, :Movie => 1966, :Talkie => 1939}
movies.each {|k, v| puts "#{k} was produced in #{v}."}
puts "Here are the movies again:"
movies.each_key {|k| puts k}
puts "Here are the dates of production, drawn from the hash values:"
movies.each_value {|v| puts v}
dates = []
movies.each_value {|v| dates.push v}
puts "Here are the same dates pushed into an array:"
puts dates
