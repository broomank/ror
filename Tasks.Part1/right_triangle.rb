puts 'Enter side A'
side_a = gets.chomp

puts 'Enter side B'
side_b = gets.chomp

puts 'Enter side C'
side_c = gets.chomp

if side_a.to_i**2 == side_b.to_i**2 + side_c.to_i**2 or side_b.to_i**2 == side_a.to_i**2 + side_c.to_i**2 or side_c.to_i**2 == side_a.to_i**2 + side_b.to_i**2
	puts'Треугольник прямоугольный'
end

if side_a == side_b or side_b == side_c or side_a == side_c
	puts'Треугольник равнобедренный'
end

if side_a == side_b && side_b == side_c
	puts 'Треугольник равносторонний'
end