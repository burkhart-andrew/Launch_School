2.1

# In this hash of people and their age,

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if there is an age present for "Spot".

# Bonus: What are two other hash methods that would work just as well for this solution?

ages['spot'] # => nil
ages.key?('spot') # => false
ages.include?('spot')
ages.member?('spot')


2.2

Add up all of the ages from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.inject(:+)


2.3

ages.delete_if {|k, v| v >= 100}
ages.keep_if {|name, age| age < 100}


2.4

#Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
#Convert the string in the following ways (code will be executed on original munsters_description above):

musters_description.capitlalize!
"The munsters are creepy in a good way."
musters_description.swapcase!
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
musters_description.downcase
"the munsters are creepy in a good way."
musters_description.upcase
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."


2.5

We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

2.6
Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


ages.min => # ['Eddie', 10]
ages.value.min => # 10


2.7

See if the name "Dino" appears in the string below:

a = "Few things in life are as important as house training your pet dinosaur."
a.match('dino') => #<MatchData 'dino'>
a.include?('dino') => # true

2.8

In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Find the index of the first name that starts with "Be"

flintstones.index { |name| name[0, 2] == "Be" } #name[0,2] searches first two letters of each name

2.9 2.10

Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0,3]}