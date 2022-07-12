goods = {}
loop do
  puts 'Enter food'
  food = gets.chomp
  break if food == 'stop'
  puts 'Enter price'
  price = gets.chomp.to_f
  puts 'Amount'
  amount = gets.chomp.to_f
  goods[food] = { price: price, amount: amount }
end
puts goods

sum_for_each_food = 0
all = 0
goods.each do |gros, total|
  total.each_value do |price, amount|
  sum_for_each_food = total[:price] * total[:amount]
  end
  all += sum_for_each_food
  puts "All #{gros} costs #{sum_for_each_food}"
end
puts "Total cost is #{all}"
