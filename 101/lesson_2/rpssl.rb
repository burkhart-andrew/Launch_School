# Rock Paper Scissors Spock Lizard

VALID_CHOICE = %w(rock paper scissors spock lizard)
WINNING_COMBOS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(lizard paper),
  'spock' => %w(rock scissors),
  'lizard' => %w(paper spock) }

SAYING_COMBOS = {
  %w(paper scissors) => 'Scissors cuts Paper',
  %w(paper rock) => 'Paper covers Rock',
  %w(lizard rock) => 'Rock crushes Lizard',
  %w(lizard spock) => 'Lizard poisons Spock',
  %w(scissors spock) => 'Spock smashes Scissors',
  %w(lizard scissors) => 'Scissors decapitates Lizard',
  %w(lizard paper) => 'Lizard eats Paper',
  %w(paper spock)  => 'Paper disproves Spock',
  %w(rock spock) => 'Spock vaporizes Rock',
  %w(rock scissors) => 'Rock crushes Scissors' }

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
  VALID_CHOICE.sample
end

def win?(first, second) # winning combinations return true
  WINNING_COMBOS[first].include?(second)
end

def display_choices(n, user, computer)
  prompt "#{n} chose #{user}. Computer chose #{computer}!"
end

def battle(user, computer) # displays if the user or computer wins
  if win?(user, computer)
    return :user_wins
  elsif win?(computer, user)
    return :computer_wins
  else
    return :draw
  end
end

def display_results(battle_method) # displays who won
  case battle_method
  when :user_wins
    prompt("*****************************************************")
    prompt 'You win!'
  when :computer_wins
    prompt("*****************************************************")
    prompt 'Computer wins!'
  when :draw
    prompt("*****************************************************")
    prompt "It's a draw!"
  end
end

def display_saying(result, user, computer) # displays game saying
  case result
  when :user_wins
    arr = [user, computer]
    arr.sort!
    prompt("*****************************************************")
    prompt SAYING_COMBOS.fetch(arr)
  when :computer_wins
    arr = [user, computer]
    arr.sort!
    prompt("*****************************************************")
    prompt SAYING_COMBOS.fetch(arr)
  when :draw
    prompt("*****************************************************")
    prompt "No winner!"
  end
end

game_score = { user: 0, computer: 0, draws: 0 }

def display_score(user_name, score) # display current game score
  prompt("*****************************************************")
  prompt("#{user_name}: #{score[:user]} | Computer: #{score[:computer]}| Draws: #{score[:draws]}")
  prompt("*****************************************************")
end

def update_score(battle_method, game_score) # updates current game score
  if battle_method == :user_wins
    game_score[:user] += 1
  elsif battle_method == :computer_wins
    game_score[:computer] += 1
  elsif battle_method == :draw
    game_score[:draws] += 1
  end
end

round_number = 1
def display_round(r) # displays current round in game
  prompt("Round #{r}")
end

# Welcome and collect name
prompt "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
name = collect_input('Please enter your name:')
prompt('Get ready for a fight!')
prompt('First to 5 points wins it all!')

# Main Loop
loop do
  display_round(round_number)
  user_choice = user_input
  computer_choice = computer_input
  display_choices(name, user_choice, computer_choice)
  winner = battle(user_choice, computer_choice)
  display_saying(winner, user_choice, computer_choice)
  display_results(winner)
  update_score(winner, game_score)
  display_score(name, game_score)
  if game_score[:user] == 5
    prompt "#{name} you are the CHAMPION of Rock, Paper, Scissors, Spock, Lizard!"
    break
  end
  if game_score[:computer] == 5
    prompt "#{name} looks like you have lost this battle. Try again another day."
    break
  end
  answer = collect_input("#{name} would you like to go another round?")
  round_number += 1
  break unless answer.downcase.start_with?('y')
end
# End Main Loop

# Good Bye!
prompt "Thank you #{name} for playing Rock, Paper, Scissors, Spock, Lizard! Good Bye!"
