alphabet = ("a" .."z").to_a
vowels1 = ["a", "e", "i", "o", 'u']

vowels = {}

vowels1.each do |letter, num|
  if alphabet.include?(letter)
  vowels[letter] = num
  end
end
puts vowels
