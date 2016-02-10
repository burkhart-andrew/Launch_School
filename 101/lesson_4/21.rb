require 'pry'
DECK = [
  { diamonds: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] },
  { clubs: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] },
  { hearts: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] },
  { spades: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] }
       ].freeze
CARD_VALUES = { :'2' => 2, :'3' => 3, :'4' => 4, :'5' => 5, :'6' => 6, :'7' => 7, :'8' => 8, :'9' => 9, :'10' => 10, jack: 10, queen: 10, king: 10, ace: 0 }

def prompt(message)
  puts "=> #{message}"
end

human = { name: "Player_1", hand: [], hand_value: 0 }
computer = { name: "Dealer", hand: [], hand_value: 0 }

def random_suit(deck) # returns a symbol representing a given suit
  suit = deck[0..3].sample
  suit = suit.keys
  suit.fetch(0)
end

def suit_position(suit) # returns 0, 1, 2, 3 representing given suit position in deck array
  case suit
  when :diamonds
    return 0
  when :clubs
    return 1
  when :hearts
    return 2
  when :spades
    return 3
  end
end

def delt_card!(deck) # randomly selects a card and then removes card from the deck
  suit_name = random_suit(deck)
  suit_pos = suit_position(suit_name)
  if deck[suit_pos][suit_name].nil?
    delt_card!(deck)
  else
    card = deck[suit_pos][suit_name].sample
    deck[suit_pos][suit_name].delete(card)
    return card
  end
end

def deal_initial_hands!(deck, player, dealer)
  player[:hand] << delt_card!(deck)
  player[:hand] << delt_card!(deck)
  dealer[:hand] << delt_card!(deck)
  dealer[:hand] << delt_card!(deck)
  add_total_to_hand_value(player)
  add_total_to_hand_value(dealer)
end

def add_total_hand_value!(person)
end

def ace_in_hand(person)
  total = person[:hand].map { |card| CARD_VALUES[card] }
  total = total.reduce(:+)
  if person[:hand].include?(:ace)
    number_of_aces = person[:hand].count(:ace)
    number_of_aces.times do
      if total <= 10
        total += 11
        person[:hand_value] = total
      elsif total >= 11
        total += 1
        person[:hand_value] = total
      end
    end # end for the do on 64
  else
    nil
  end
end

def add_total_to_hand_value(person)
  cards_in_hand = person[:hand]
  total = cards_in_hand.map { |card| CARD_VALUES[card] }
  total = total.reduce(:+)
  if ace_in_hand(person)
    ace_in_hand(person)
  else
    person[:hand_value] = total
  end
end

def display_hand_value(player, dealer)
prompt "#{player[:name]} has #{player[:hand_value]}. #{dealer[:name]} has #{dealer[:hand_value]}."
end

def hit!(deck, person)
  new_card = delt_card!(deck)
  person[:hand] << new_card
  prompt "#{new_card}"
end

def hit_stay_loop(deck, person, dealer)
  loop do
    prompt "Do you want to HIT or STAY?"
    hit_or_stay = gets.chomp.downcase
    if hit_or_stay.start_with?('h')
      hit!(deck, person)
      add_total_to_hand_value(person)
      prompt "You now have #{person[:hand_value]}."
      if busted?(person) || blackjack?(person, dealer)
        binding.pry
        break   #not breaking when 
      end
    elsif hit_or_stay.start_with?('s')
      break
    else
      prompt "Please type HIT or STAY."
    end
  end
end

def dealer_hit_or_stay(deck, dealer)
  loop do
    if dealer[:hand_value] <= 17
      prompt "#{dealer[:name]} will hit."
      hit!(deck, dealer)
      add_total_to_hand_value(dealer)
      prompt "#{dealer[:name]} now has #{dealer[:hand_value]}."
      if busted?(dealer)
        break
      end
    else
      prompt "Dealer will stay."
      break
    end
  end
end

def busted?(person)
  binding.pry
  person[:hand_value] >= 22
  prompt "#{person[:name]} busted!"
end

def blackjack?(player, dealer)
  if player[:hand_value] == 21
    prompt "#{player[:name]} has a BLACKJACK! You win!"
    return player
  elsif dealer[:hand_value] == 21
    prompt "#{dealer[:name]} has a BLACKJACK! You lose!"
    return dealer
  end
end

def winner(player, dealer)
  if player[:hand_value] > dealer[:hand_value]
    return player[:name]
  else
    return dealer[:name]
  end
end

def display_winner(player, dealer)
  if winner(player, dealer) == player[:name]
    prompt "You win!"
  else
    prompt "You lost! Dealer wins!"
  end
end

loop do
  deck = DECK
  human = { name: "Player_1", hand: [], hand_value: 0 }
  computer = { name: "Dealer", hand: [], hand_value: 0 }
  system 'clear'
  loop do
    deal_initial_hands!(deck, human, computer)
    prompt "You have: #{human[:hand][0]} and #{human[:hand][1]}."
    prompt "Dealer has: #{computer[:hand][1]} and a unknown card."
    display_hand_value(human, computer)
    if blackjack?(human, computer)
      break
    end
    hit_stay_loop(deck, human, computer)
    if busted?(human) || blackjack?(human, computer)
      break
    end
    display_hand_value(human, computer)
    dealer_hit_or_stay(deck, computer)
    if busted?(computer) || blackjack?(human, computer)
      break
    end
    display_winner(human, computer)
      break
  end
  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing 21!"

# todo:
# 1. fix game loop (play again? after a bust or blackjack)
# 2. show hit card
# 3.

# 10 current rubocop offenses