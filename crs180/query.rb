require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'sequel_single_table')

def currency_format(number)
  format("$%0.2f", number)
end

query = DB[:menu_items].select do 
  [
    item,
    menu_price,
    ingredient_cost,
    ((12.00 / 60.00) * prep_time).as(labor),
    (menu_price - ingredient_cost - ((12.00 / 60.00) * prep_time)).as(profit)
  ]
end

query.each do |row|
  puts row[:item]
  puts "menu price: #{currency_format(row[:menu_price])}"
  puts "ingredient cost: #{currency_format(row[:ingredient_cost])}"
  puts "labor: #{currency_format(row[:labor])}"
  puts "profit: #{currency_format(row[:profit])}\n\n"
end