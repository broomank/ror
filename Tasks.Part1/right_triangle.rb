puts 'Enter side A'
side_a = gets.chomp
puts 'Enter side B'
side_b = gets.chomp
puts 'Enter side C'
side_c = gets.chomp
if side_a.to_i**2 == side_b.to_i**2 + side_c.to_i**2 || side_b.to_i**2 == side_a.to_i**2 + side_c.to_i**2 || side_c.to_i**2 == side_a.to_i**2 + side_b.to_i**2
	puts'Треугольник прямоугольный'
end
if side_a.to_i == side_b.to_i or side_b.to_i == side_c.to_i or side_a.to_i == side_c.to_i
	puts'Треугольник равнобедренный'
end
if side_a.to_i == side_b.to_i && side_b.to_i == side_c.to_i
	puts 'Треугольник равносторонний'
end
