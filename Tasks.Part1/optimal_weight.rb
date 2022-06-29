puts "What's your name?"
name = gets.chomp

puts "What's your height(cm)?"
height = Integer(gets.chomp)

optimal_weight = (height- 110) * 1.15
  if optimal_weight < 0
    puts "Your weight is optimal"
  else
    puts "#{name}, your optimal weight is #{optimal_weight}kg."
  end
