movies = {:Flick => 1934, :Film => 1976, :Movie => 1966, :Talkie => 1939}
movies.each {|k, v| puts "#{k.to_s} was produced in #{v}."}
puts "Here are the movies again:"
movies.each_key {|k| puts k}
puts "Here are the dates of production:"
movies.each_value {|v| puts v}
dates = []
movies.each_value {|v| dates.push v}
puts "Here are the same dates pushed into an array:"
puts dates
