#Car Exercise from Classes and Objects Part 1

#1. Create a class called MyCar. When you initialize a new instance or object of the class, 
# allow the user to define some instance variables that tell us the year, color, 
# and model of the car. Create an instance variable that is set to 0 during instantiation of 
# the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
	attr_accessor :color
	attr_reader :year
	def initialize(year, model, color)
		@year = year
		@model = model
		@color = color
		@current_speed = 0
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

end
