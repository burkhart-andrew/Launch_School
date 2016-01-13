# Calculator.rb

# Objectives:
# asks for two numbers
# ask for the type of operation to perform: add, subtract, mulitply or divide
# displays a result

# defining methods

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(operator)
  case operator
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

# Welcome Prompt and user name
prompt "Welcome to Calculator! Please enter your name:"
name = gets.chomp

loop do
  if name.empty?
    prompt 'Make sure to enter a valid name.'
  else
    break
  end
end

prompt "Hello #{name}! Lets tackle those calculations now."

loop do # Main Loop
  # collecting user numbers
  number_1 = ''
  loop do
    prompt 'Please enter the first number:'
    number_1 = gets.chomp.to_i
    if valid_number?(number_1)
      break
    else
      prompt "Hmm... that doesn't look like a valid number"
    end
  end

  number_2 = ''
  loop do
    prompt "Please enter the second number:"
    number_2 = gets.chomp.to_i
    if valid_number?(number_2)
      break
    else
      prompt "Hmm... that doesn't look like a valid number"
    end
  end

  # asking for operator

  operator_prompt = <<-MSG
  Please enter the number of the operator you would like to perform:
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt operator_prompt

  # refactored operator calculations
  operator = ''
  result = ''
  loop do
    operator = gets.chomp
    result = case operator
             when '1'
               result = number_1 + number_2
               break
             when '2'
               result = number_1 - number_2
               break
             when '3'
               result = number_1 * number_2
               break
             when '4'
               result = number_1.to_f / number_2.to_f
               break
             else
               prompt "#{name} that's not a valid operator. Please choose 1, 2, 3, 4."
             end
  end

  # summary of operation and numbers
  prompt "#{operation_to_message(operator)} #{number_1} and #{number_2}..."

  # output the result to the user
  prompt "Results in #{result}"

  prompt "Woah... that was an amazing calculation you did #{name}. Type Y to perform another."
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end of Main Loop

prompt 'Thank you for using Calculator. Good bye!'
