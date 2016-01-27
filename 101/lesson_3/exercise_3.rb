3.1

Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

3.2

How can we add the family pet "Dino" to our usual array:

flintstones.push("Dino")
flintstones << "Dino"

3.3
How can we add multiple items to our array? (Dino and Hoppy)

flintstones.push("Dino", "Hoppy")
flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy))

3.4

Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

advice.slice!(0, advice.index('house'))


3.5

Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

statement.scan('t').count # => 2
statement.count('t') # => 2

3.6

title = "Flintstone Family Members"

title.center(40)
