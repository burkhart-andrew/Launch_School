# number_1 = 2
# number_2 = 1

def get_operator()
  operator_prompt = <<-MSG
  Please enter the number of the operator you would like to perform:
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG
  puts operator_prompt
  loop do
    operator = gets.chomp
      if /[1-4]/.match(operator) == nil
        puts "#{name} that's not a valid operator. Please choose 1, 2, 3, 4."
      else
        return operator
        break
      end
  end
end


#   operator = ''
#   result = ''
# 	loop do
#     operator = gets.chomp
#     result = case operator
#              when '1'
#                result = number_1 + number_2
#                break
#              when '2'
#                result = number_1 - number_2
#                break
#              when '3'
#                result = number_1 * number_2
#                break
#              when '4'
#                result = number_1 / number_2
#                break
#              else
#                puts "#{name} that's not a valid operator. Please choose 1, 2, 3, 4."
#              end
#   end
#   return operator
# end


  # operator_prompt = <<-MSG
  # Please enter the number of the operator you would like to perform:
  # 1) add
  # 2) subtract
  # 3) multiply
  # 4) divide
  # MSG

  # prompt operator_prompt

  # # refactored operator calculations
  # operator = ''
  # result = ''
  # loop do
  #   operator = gets.chomp
  #   result = case operator
  #            when '1'
  #              result = number_1 + number_2
  #              break
  #            when '2'
  #              result = number_1 - number_2
  #              break
  #            when '3'
  #              result = number_1 * number_2
  #              break
  #            when '4'
  #              result = number_1.to_f / number_2.to_f
  #              break
  #            else
  #              prompt "#{name} that's not a valid operator. Please choose 1, 2, 3, 4."
  #            end
  # end