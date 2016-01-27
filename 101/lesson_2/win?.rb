# def win?(first, second) #if returning
#   (first =='rock' && second == 'scissors'|| second == 'lizard') ||
#     (first == 'paper' && second == 'rock' || second == 'spock') ||
#     (first == 'scissors' && second == 'lizard' || second == 'paper') ||
#     (first == 'spock' && second == 'rock' || second == 'scissors') ||
#     (first == 'lizard' && second == 'paper' || second == 'spock')
# end

# def display_results(user, computer)
# 	if win?(user, computer)
# 		puts "You won!"
# 	elsif win?(computer, user)
# 		puts "Computer won!"
# 	else
# 		puts "Its a tie!"
# 	end
# end

# user_choice = 'rock'
# computer_choice = 'spock'

# display_results(user_choice, computer_choice)
WINNING_COMBOS = { rock: ['scissors', 'lizard'], paper: ['rock', 'spock'], scissors: ['lizard', 'paper'], spock: ['rock', 'scissors'], lizard: ['paper', 'spock'] }

def win?(first, second) # winning combinations return true
  WINNING_COMBOS[first].include?(second)
end


win?(:rock, 'scissors')