puts 'введите коэфициент А'
a = Integer(gets.chomp)
puts 'введите коэфициент B'
b = Integer(gets.chomp)
puts 'введите коэфициент C'
c = Integer(gets.chomp)
d = b**2 - (4 * a * c)
if d < 0
  puts "Дискриминант=#{d}, корней нет"
elsif d > 0
  х1 = (- b + Math.sqrt(d))/(2 * a)
  x2 = (- b - Math.sqrt(d))/(2 * a)
  puts "Дискриминант=#{d}, X1=#{х1} and X2=#{x2}" 
else
  x1 = - b / ( 2 * a )
  x2 = x1
  puts "Дискриминант=#{d}, X1=X2=#{x1}"
end
