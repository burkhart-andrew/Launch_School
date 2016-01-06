#1. Add a class method to your MyCar class that calculates the gas mileage of any car.
#2. Override the to_s method to create a user friendly print out of your object.

#MyCar from 2.1.rb

class MyCar
	attr_accessor :color
	attr_reader :year, :model
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
	def self.gas_mileage(miles_driven, fuel_consumed)
		gas_mileage = miles_driven / fuel_consumed
		puts "Your car is getting a gas mileage of #{gas_mileage} miles per gallon!"
	end
	def to_s
		puts "Car Info: You own a #{self.color} #{self.year} #{self.model}."
	end

end