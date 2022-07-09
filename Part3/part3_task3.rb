arr = [0, 1]
loop do
  num = arr[-1] + arr[-2]
  break if num >= 100
  arr.push(num) 
end
puts arr 

