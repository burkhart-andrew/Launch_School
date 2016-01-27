# Hashes are commonly found to be more complex than the simple one we saw earlier:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# It is often the case that each key points to another hash instead of a single value:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
# Figure out the total age of just the male members of the family.

total_age = 0
munsters.each {|person, details| 
	if details["gender"] == "male"
		total_age += details["age"]
		puts total_age
	end
}

SOLUTION
total_male_age = 0
munsters.each do |name, details| 
	total_male_age += details["age"] if details["gender"] == 'male'
end
