# 7. Create a class 'Student' with attributes name and grade. 
# Do NOT make the grade getter public, so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so...

# puts "Well done!" if joe.better_grade_than?(bob)

class Student
	def initialize(name, grade)
		@name = name
		@grade = grade
	end
	
	def better_grade_than?(student)
		grade > student.grade 
	end

protected
	def grade
		@grade
	end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)


puts "Well done!" if joe.better_grade_than?(bob)
puts "++++++++++++++++++++++++++++++++++++++++++"
puts "Well done!" if bob.better_grade_than?(joe)
puts "+++++++++++++++++++++++++++++++++++++++++++"
puts "Well done!" if joe.better_grade_than?(bob)