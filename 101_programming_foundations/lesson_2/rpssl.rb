# Rock Paper Scissors Spock Lizard

VALID_CHOICE = %w(rock paper scissors spock lizard)
WINNING_COMBOS = { 'rock' => ['scissors', 'lizard'], 'paper' => ['rock', 'spock'], 'scissors' => ['lizard', 'paper'], 'spock' => ['rock', 'scissors'], 'lizard' => ['paper', 'spock'] }
CHOICE_COMBOS = {}
SAYING_COMBOS = { ['scissors', 'paper'] => 'Scissors cuts Paper', 2: 'Paper covers Rock', 3: 'Rock crushes Lizard', 4: 'Lizard poisons Spock', 5: 'Spock smashes Scissors', 6: 'Scissors decapitates Lizard', 7: 'Lizard eats Paper', 8: 'Paper disproves Spock', 9: 'Spock vaporizes Rock', 10: 'Rock crushes Scissors' }

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

def user_input # returns user choice
  loop do
    input = collect_input("Please choose your weapon: #{VALID_CHOICE}!")
    input = input.downcase
    if VALID_CHOICE.include?(input)
      return input
    else
      prompt "Hmm... that's not a valid weapon. Try a different one!"
    end
  end
end

def computer_input # returns computer choice
  return VALID_CHOICE.sample
end

def win?(first, second) # winning combinations return true
  WINNING_COMBOS[first].include?(second)
end

def display_choices(n, user, computer)
  prompt "#{n} chose #{user}. Computer chose #{computer}!"
end

def battle(user, computer) # displays if the user or computer wins
  if win?(user, computer)
    return 1
  elsif win?(computer, user)
    return 2
  else
    return 3
  end
end

def display_results(battle_method)
  case battle_method
  when 1
    prompt("*****************************************************")
    prompt 'You win!'
  when 2
    prompt("*****************************************************")
    prompt 'Computer wins!'
  when 3
    prompt("*****************************************************")
    prompt "It's a draw!"
  end
end

def display_saying(user, computer)

end
game_score = { user: 0, computer: 0 }

def display_score(user_name, score)
  prompt("*****************************************************")
  prompt("#{user_name}: #{score[:user]} | Computer: #{score[:computer]}")
  prompt("*****************************************************")
end

def update_score(battle_method, game_score)
  if battle_method == 1
    game_score[:user] += 1
  elsif battle_method == 2
    game_score[:computer] += 1
  end
end

round_number = 1
def display_round(r)
  prompt("Round #{r}")
end

# Welcome and collect name
prompt "Welcome to Rock Paper Scissors Spock Lizard!"
name = collect_input('Please enter your name:')
prompt('Get ready for a fight!')

loop do
  display_round(round_number)
  user_choice = user_input
  computer_choice = computer_input
  display_choices(name, user_choice, computer_choice)
  winner = battle(user_choice, computer_choice)
  display_results(winner)
  update_score(winner, game_score)
  display_score(name, game_score)
  answer = collect_input("#{name} would you like to go another round?")
  round_number += 1
  break unless answer.downcase.start_with?('y')
end
# End Main Loop

# Good Bye!
prompt "Thank you #{name} for playing VALID_CHOICE! Good Bye!"
