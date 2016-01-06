#1. Create a superclass called Vehicle for your MyCar class to inherit from and move 
# the behavior that isn't specific to the MyCar class to the superclass. Create a 
# constant in your MyCar class that stores information about the vehicle that 
# makes it different from other types of Vehicles.
# Then create a new class called MyTruck that inherits from your superclass that 
# also has a constant defined that separates it from the MyCar class in some way.

#2.  Add a class variable to your superclass that can keep track of the
 # number of objects created that inherit from the superclass. 
 # Create a method to print out the value of this class variable as well.

#3. Create a module that you can mix in to ONE of your subclasses 
#that describes a behavior unique to that subclass.

#4. Print to the screen your method lookup for the classes that you have created.

#5. Move all of the methods from the MyCar class that also pertain to the MyTruck 
# class into the Vehicle class. Make sure that all of your previous method calls 
# are working when you are finished.

#6. Write a method called age that calls a private method to calculate 
# the age of the vehicle. Make sure the private method is not available 
# rom outside of the class. You'll need to use Ruby's built-in Time class 
# to help.


# MyCar from 3.1


module Offroad
	def fourwheeldrive 
		puts "We are going offroad!"
	end
end

class Vehicle
	attr_accessor :color, :total_number_of_vehicles
	attr_reader :year, :model

	#total_number_of_vehicles = 0
	
	def initialize(year, model, color)
		@year = year
		@model = model
		@color = color
		@current_speed = 0
		@@total_number_of_vehicles ||= 0
		@@total_number_of_vehicles += 1
	end

	def speed_up(s)
		@current_speed += s
		puts "You hit the gas and are now going #{@current_speed}mph!"
	end

	def brake(s)
		@current_speed -= s
		puts "You hit the brake and are now going #{@current_speed}mph!"
	end

	def shut_down
		@current_speed = 0
		puts "Let's park this bad boy!"
	end

	def spray_paint(new_color)
		self.color = new_color
	end

	def self.gas_mileage(miles_driven, fuel_consumed)
		gas_mileage = miles_driven / fuel_consumed
		puts "Your car is getting a gas mileage of #{gas_mileage} miles per gallon!"
	end

	def to_s
		puts "Car Info: You own a #{self.color} #{self.year} #{self.model}."
	end
	def self.total
		puts @@total_number_of_vehicles
	end

	def age
		puts "Your #{self.model} is #{years_old} years old."
	end

	private

	def years_old
		Time.now.year - self.year.to_i
	end

	public
end


class MyCar < Vehicle
	NUMBER_OF_DOORS = 4 

	def to_s
		puts "Car Info: You own a #{self.color} #{self.year} #{self.model}."
	end

end

class MyTruck < Vehicle
	NUMBER_OF_DOORS = 2
	include Offroad
	
	def to_s
		puts "Truck Info: You own a #{self.color} #{self.year} #{self.model}."
	end
end

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vechicle.ancestors