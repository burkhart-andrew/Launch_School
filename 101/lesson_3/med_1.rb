1. 
10.times {|n| puts (" " * number) + "The Flintstones Rock!"}



The Flintstones Rock!


2.

statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

2.

puts "the value of 40 + 2 is " + (40 + 2)

puts "the value of 40 + 2 is " + (40 + 2).to_s

n = (40 +2)
puts "the value of 40 + 2 is " + n.to_s

puts "the value of 40 + 2 is #{40 + 2}"

3.