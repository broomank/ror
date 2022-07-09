alphabet = ("a".."z")
vowels1 = ["a", "e", "i", "o", 'u']

vowels = {}

alphabet.each_with_index do |letter, index|
  if vowels1.include?(letter)
  vowels[letter] = index + 1
  end
end
puts vowels
