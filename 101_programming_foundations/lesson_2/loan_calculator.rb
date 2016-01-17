# Loan Calculator

# Monthly Payment Forumula
# P = L[c(1 + c)^n]/[((1 + c)^n) - 1]

# P = fixed monthly payment
# L = loan amount
# n = term months
# c = monthly interest rate (6% ~ 0.06/12 = 0.005)



# Remain Loan Balance Formula
# B = L[((1 + c)^n) - (1 + c)^P]/[((1 + c)^n) - 1]

# B = remaining loan balance
# L = loan amount
# n = term months
# p = number of months paid


# makes fancy rocket
def prompt(message)
  puts "=> #{message}"
end

# collecting user name
def collect_name
  prompt 'Welcome to Loan Calculator! Please enter your name:'
  name = gets.chomp
  loop do
    if name.empty?
      prompt 'Make sure to enter a valid name.'
    else
      return name
    end
  end
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
def user_input(p)
  loop do
    prompt p
    var = gets.chomp
    if number?(var)
      return var
    else
      prompt 'Invalid choice. Please try again.'
    end
  end
end

def loan_type(p)
  loop do
    prompt p
    loan_type = gets.chomp
    loan_type = loan_type.downcase
    if loan_type =='car' || loan_type == 'home'
      return loan_type
    else
      prompt "Please enter 'home' or 'car'. Try again."
    end
  end
end

def monthly_payment(loan_amount, loan_term, loan_rate)
  loan_amount = loan_amount.to_f
  loan_term = loan_term.to_f
  loan_rate = (loan_rate.to_f / 100) / 12
  loan_payment = loan_amount * (loan_rate * ((1 + loan_rate)**loan_term)) / (((1 + loan_rate)**loan_term) - 1)
  return loan_payment
end

# Welcome and collecting user name
name = collect_name

loan_type = loan_type('Are you looking for a home or car loan?')
loan_amount = user_input('Please enter the loan amount in dollars:')
loan_term = user_input('Please enter the loan term in months:')
loan_rate = user_input('Please enter the interest rate per year (ex. 6%):')
prompt "The monthly payment for your #{loan_type} with starting balance of $#{loan_amount} with a interest rate of #{loan_rate} for #{loan_term} months is:"

prompt "$ #{monthly_payment(loan_amount, loan_term, loan_rate)}"


