puts 'введите коэфициент А'
a = gets.chomp

puts 'введите коэфициент B'
b = gets.chomp

puts 'введите коэфициент C'
c = gets.chomp

d = b.to_i ** 2 - ( 4 * a.to_i * c.to_i)


if d < 0
	puts "Дискриминант=#{d}, корней нет"
elsif d > 0

	х1 = ( - b.to_i + Math.sqrt(d.to_i)) / (2 * a.to_i)
	x2 = ( - b.to_i - Math.sqrt(d.to_i)) / (2 * a.to_i)
	puts "Дискриминант=#{d}, X1=#{х1} and X2=#{x2}" 
else
	x1 = - b.to_i / ( 2 * a.to_i )
	x2 = x1
	puts "Дискриминант=#{d}, X1=X2=#{x1}"
end