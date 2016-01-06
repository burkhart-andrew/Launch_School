class GoodDog
	attr_accessor :name, :height, :weight

	def initialize(n, h, w)
		@name = n #instance variable
		@height = h
		@weight = w
	end
	def speak
		"#{name} says arf!"
	end
	def change_info(n, h, w)
		self.name = n
		self.height = h
		self.weight = w
	end

	def info
		"#{self.name} is #{self.weight} and #{self.height}."
	end
end

sparky = GoodDog.new("Sparky", "32 inches", "55 pounds")

puts sparky.speak
puts sparky.name
sparky.name = "Spartacus"
puts sparky.info