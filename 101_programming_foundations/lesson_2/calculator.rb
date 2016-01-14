# Calculator.rb

# Objectives:
# asks for two numbers
# ask for the type of operation to perform: add, subtract, mulitply or divide
# displays a result

###################
# METHODS
###################
# makes fancy rocket
def prompt(message)
  puts "=> #{message}"
end

# collecting user name
def get_name()
  prompt 'Welcome to Calculator! Please enter your name:'
  name = gets.chomp
  loop do
    if name.empty?
      prompt 'Make sure to enter a valid name.'
    else
      break
    end
  end
  return name
end

# number validations
def number?(input)
  integer?(input) || float?(input)
end
def integer?(input)
  /^\d+$/.match(input)
end
def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

# collecting user number input
def get_user_input(p)
  loop do
    prompt p
    var = gets.chomp
      if number?(var) == nil
        prompt 'Invalid choice. Please try again.'
      else
        return var
        break
      end
  end
end

# performing calculation using user operator and number selections
def calculate(operator, number_1, number_2)
  case operator
  when '1'
    result = number_1 + number_2
  when '2'
    result = number_1 - number_2
  when '3'
    result = number_1 * number_2
  when '4'
    result = number_1.to_f / number_2.to_f
  end
  return result
end

# displays selected operator
def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

###################
# ENTER THE CALCULATOR
###################

# collecting user name
name = get_name()

# welcome prompt
prompt "Hello #{name}! Lets tackle those calculations now."

# main loop
loop do
  # prompting user number input
  number_1 = get_user_input('Please enter the first number:').to_f
  number_2 = get_user_input('Please enter the second number:').to_f

  # prompt for operator
  operator_prompt = <<-MSG
  Please enter the number of the operator you would like to perform:
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG
  prompt operator_prompt

  # prompting for user operator
  operator = ''
  loop do
    operator = get_user_input("Please select the operator 1-4:")
    if operator.to_i >= 1 && operator.to_i <= 4
      break
    else
      prompt "#{name} that's not a valid operator. Please choose 1, 2, 3, 4."
    end
  end

  # completeing intense math calculations
  result = calculate(operator, number_1, number_2)

  # summary of operation and numbers
  prompt "#{operation_to_message(operator)} #{number_1} and #{number_2}..."

  # output the result to the user
  prompt "Results in #{result}"
  prompt "Woah... that was an amazing calculation you did #{name}. Type Y to perform another."
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 
# end main loop

# good bye prompt
prompt 'Thank you for using Calculator. Good bye!'
