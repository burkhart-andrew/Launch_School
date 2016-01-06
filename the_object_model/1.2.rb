#2. What is a module? What is its purpose? How do we use them with our classes? 
#Create a module for the class you created in exercise 1 and include it properly.

#A module allows one to add behaviors to a class. A module can be extended to different objects within a class or within other classes via mixins. 



class Family
	include Relationship
end

module Relationship
	def father(father, child)
		puts "#{father} is the father of #{child}"
	end

	def mother(mother, child)
		puts "#{mother} is the mohter of #{child}"
	end
end


andrew = Family.new
courtney = Family.new
jackson = Family.new
isaac = Family.new

andrew.father("Andrew", "Jackson")

#SOLUTION
#A module allows us to group reusable code into one place. 
# We use modules in our classes by using the include reserved word, 
# followed by the module name. Modules are also used as a namespace.

# module Study
# end

# class MyClass
#   include Study
# end

# my_obj = MyClass.new