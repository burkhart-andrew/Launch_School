#walk_through_calculator

#asks for two numbers
#ask for the type of operation to perform: add, subtract, mulitply or divide
#displays a result

#collecting user numbers
puts("Please enter the first number:")
number_1 = gets.chomp
puts("Please enter the second number:")
number_2 = gets.chomp

#asking for operator
puts("Please enter what operation you would like to perform (add, subtract, multiply, or divide):")
operator = gets.chomp

#operator specific calculations

#add
if operator == "add"
	result = number_1.to_i + number_2.to_i

#subtract
elsif operator == "subtract"
	result = number_1.to_i - number_2.to_i

#multiply
elsif operator == "multiply"
	result = number_1.to_i * number_2.to_i

#divide
else operator == "divide"
	result = number_1.to_f / number_2.to_f

end

#output the result to the user
puts("Answer = #{result}")