puts 'Enter side A'
side_a = Integer(gets.chomp)

puts 'Enter side B'
side_b = Integer(gets.chomp)

puts 'Enter side C'
side_c = Integer(gets.chomp)

if side_a ** 2 == side_b ** 2 + side_c ** 2 || side_b ** 2 == side_a ** 2 + side_c ** 2 || side_c ** 2 == side_a ** 2 + side_b ** 2
	puts'Треугольник прямоугольный'
end

if side_a == side_b or side_b == side_c or side_a == side_c
	puts'Треугольник равнобедренный'
end

if side_a == side_b && side_b == side_c
	puts 'Треугольник равносторонний'
end
