# rock_paper_scissors.rb

# GAME FLOW
# the user makes a choice
# the computer makes a choice
# the winner is displayed

def prompt(message)
  puts "=> #{message}"
end

def collect_input(p)
  loop do
    prompt p
    input = gets.chomp
    if input.empty?
      puts "Please try again."
    else
      return input
    end
  end
end

def user_input
  loop do
    input = collect_input('Please choose your weapon: Rock, Paper, or Scissors!')
    input = input.downcase
    if input == 'rock'
      return 'rock'
    elsif input == 'paper'
      return 'paper'
    elsif input == 'scissors'
      return 'scissiors'
    else
      prompt 'Try again! Please enter Rock, Paper, or Scissors.'
    end
  end
end

def computer_choice
  choice = rand(1..3)
  if choice == 1
    return 'rock'
  elsif choice == 2
    return 'paper'
  else
    return 'scissors'
  end
end

def user_vs_computer(u_c, c_c, n)
  case u_c
  when 'rock'
    if c_c == 'rock'
      prompt 'Draw!'
    elsif c_c == 'paper'
      prompt 'Paper covers Rock. Computer wins!'
      return 1
    elsif c_c == 'scissors'
      prompt "Rock breaks Scissors. #{n} wins!"
      return 2
    end
  when 'paper'
    if c_c == 'rock'
      prompt "Paper covers Rock. #{n} wins!"
      return 2
    elsif c_c == 'paper'
      prompt 'Draw!'
    elsif c_c == 'scissors'
      prompt 'Scissors cuts Paper. Computer wins!'
      return 1
    end
  when 'scissors'
    if c_c == 'rock'
      prompt 'Rock breaks Scissors. Computer wins!'
      return 1
    elsif c_c == 'scissors'
      prompt 'Draw!'
    elsif c_c == 'paper'
      prompt "Scissors cuts Paper. #{n} wins!"
      return 2
    end
  end
end

user_score = 0
computer_score = 0

def display_score(n, game_score)
  prompt("*****************************************************")
  prompt("#{n}: #{game_score[:user]} | Computer: #{game_score[:computer]}")
  prompt("*****************************************************")
end

game_score = {:user => 0, :computer => 0}

def update_score(w, game_score)
  if w == 2
    game_score[:user] += 1
  elsif w == 2
    game_score[:user] += 1
  elsif w == 2
    game_score[:user] += 1
  elsif w == 1
    game_score[:computer] += 1
  elsif w == 1
    game_score[:computer] += 1
  elsif w == 1
    game_score[:computer] += 1
  end
end

r = 1
def display_round(r)
  prompt("Round #{r}")
end

# Welcome and collect name
prompt('Welcome to Rock, Paper, Scissors!')
name = collect_input('What is your name?')
prompt('Get ready for a fight!')

# Main Loop
loop do
  display_round(r)
  display_score(n, game_score)
  user_choice = user_input
  winner = user_vs_computer(user_choice, computer_choice, name)
  update_score(winner, game_score)
  display_score(name, game_score)
  answer = collect_input("#{name} would you like to go another round?")
  r += 1
  break unless answer.downcase.start_with?('y')
end
# End Main Loop

# Good Bye!
prompt "Thank you #{name} for playing Rock, Paper, Scissors! Good Bye!"
