puts 'Enter a day'
day = gets.chomp.to_i
puts 'Enter a month'
month = gets.chomp.to_i
puts 'Enter a year'
year = gets.chomp.to_i

sum = 0
months = %w[31 28 31 30 31 30 31 31 30 31 30 31]

if year % 4 != 0
  months[1] = 28
  elsif year % 100 != 0      #   определение високосного года
  months[1] = 29
  elsif year % 400 == 0
  months[1] = 29
  else months[1] = 28
end

months.each_with_index() do |days, index|
sum += days.to_i if index < month
end

result = sum + day
puts "The date number is #{result}"
