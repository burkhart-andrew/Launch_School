1.1
# numbers = [1, 2, 2, 3]
# numbers.uniq   # => [1,2,3]

# puts numbers   
# => 
# 1
# 2
# 3
# 4


# Removes duplicates and returns a new array

1.2

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios: 1. what is != and where should you use it? 2. put ! before something, like !user_name 3. put ! after something, like words.uniq! 4. put ? before something 5. put ? after something 6. put !! before something, like !!user_name

# ! is used when we want to show a method is destructive.
# ? is used when we want to show a method will result in a boolean
#1. != means does not equal, could use it to make sure someone doesnt use 0
#2. !n makes something false <boolean opposite>
#3. n! results in a method error main:Object
#4. ?b makes b into a string
#5. b? results in a method error main:Object 
#6. !!b results in true <boolean equivilent>

1.3

# Replace the word "important" with "urgent" in this string:

# advice = "Few things in life are as important as house training your pet dinosaur."

#advice.gsub!('important', 'urgent')

1.4

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

# numbers = [1, 2, 3, 4, 5]
# What does the follow method calls do (assume we reset numbers to the original array between method calls)?

# numbers.delete_at(1) => [1,3,4,5]
# numbers.delete(1) => [2,3,4,5]

1.5

#Programmatically determine if 42 lies between 10 and 100.
#hint: Use Ruby's range object in your solution.

#(10..100).include?(42) => true
#(10..100).cover?(42) => true

1.6
# #Starting with the string:

# famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

famous_words.prepend("Four score and ")
start = "Four score and "
puts start + famous_words
start << famous_words

1.7

# 42

1.8

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

1.9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintsones.assoc("Barney")

1.10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end