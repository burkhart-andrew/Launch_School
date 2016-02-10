require 'pry'
DECK = [
  { diamonds: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] },
  { clubs: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] },
  { hearts: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] },
  { spades: [:'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10', :jack, :queen, :king, :ace] }].freeze

CARD_VALUES = { :'2' => 2, :'3' => 3, :'4' => 4, :'5' => 5, :'6' => 6, :'7' => 7, :'8' => 8, :'9' => 9, :'10' => 10, jack: 10, queen: 10, king: 10, ace: 0 }.freeze

def prompt(message)
  puts "=> #{message}"
end

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
  if deck[suit_pos][suit_name].nil? # recursive function in situation where a suit is empty
    delt_card!(deck)
  else
    card = deck[suit_pos][suit_name].sample
    deck[suit_pos][suit_name].delete(card) # delt card is deleted
    return card
  end
end

def deal_initial_hands!(deck, player, dealer) # deals inital hand and adds cards to player hand
  player[:hand] << delt_card!(deck)
  player[:hand] << delt_card!(deck)
  dealer[:hand] << delt_card!(deck)
  dealer[:hand] << delt_card!(deck)
  add_total_to_hand_value(player)
  add_total_to_hand_value(dealer)
end

def ace_in_hand(person) # logic for determining what value ace should have depending on hand total
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
  end
end

def add_total_to_hand_value(person) # adds hand value to player/dealer hash
  cards_in_hand = person[:hand]
  total = cards_in_hand.map { |card| CARD_VALUES[card] }
  total = total.reduce(:+)
  if ace_in_hand(person)
    ace_in_hand(person)
  else
    person[:hand_value] = total
  end
end

def display_hand_value(player) # display player hand total
  prompt "#{player[:name]} has #{player[:hand_value]}."
end

def hit!(deck, person) # dealing hit card and displaying it
  new_card = delt_card!(deck)
  person[:hand] << new_card
  prompt "#{new_card.to_s.capitalize}"
end

def hit_loop(deck, person) # main hit logic
  hit!(deck, person)
  add_total_to_hand_value(person)
end

def collect_response # collect user hit/stay response
  prompt "Do you want to HIT or STAY?"
  hit_or_stay = gets.chomp.downcase
  if hit_or_stay.start_with?('h')
    :hit
  elsif hit_or_stay.start_with?('s')
    :stay
  else
    prompt "Please type HIT or STAY."
  end
end

def hit_stay_loop(deck, person, dealer) # hit/stay logic for player
  loop do
    if busted?(person, dealer) || blackjack?(person, dealer)
      break
    else
      hit_or_stay = collect_response
      if hit_or_stay == :hit
        hit_loop(deck, person)
        prompt "You now have #{person[:hand_value]}."
      elsif hit_or_stay == :stay
        break
      end
    end
  end
end

def dealer_hit_or_stay(deck, person, dealer) # hit/stay logic for dealer
  loop do
    if busted?(person, dealer) || blackjack?(person, dealer)
      break
    else
      if dealer[:hand_value] <= 17
        prompt "#{dealer[:name]} will hit."
        hit_loop(deck, dealer)
      else
        prompt "Dealer will stay at #{dealer[:hand_value]}."
        break
      end
    end
  end
end

def busted?(player, dealer) # detects if someone has busted
  if player[:hand_value] >= 22
    return player[:name]
  elsif dealer[:hand_value] >= 22
    return dealer[:name]
  end
end

def busted_prompt(player, dealer) # displays who has busted
  case busted?(player, dealer)
  when player[:name]
    prompt "#{player[:name]} busted  at #{player[:hand_value]}!"
  else dealer[:name]
    prompt "#{dealer[:name]} busted at #{dealer[:hand_value]}!"
  end
end

def blackjack?(player, dealer) # detects if there is a blackjack
  if player[:hand_value] == 21
    return player[:name]
  elsif dealer[:hand_value] == 21
    return dealer[:name]
  end
end

def blackjack_prompt(player, dealer) # displays who has a blackjack
  case blackjack?(player, dealer)
  when player[:name]
    prompt "#{player[:name]} has a BLACKJACK!"
  else dealer[:name]
    prompt "#{dealer[:name]} has a BLACKJACK!"
  end
end

def check_for_bust(person, dealer) # checks for bust and returns prompt and winner
  if busted?(person, dealer)
    busted_prompt(person, dealer)
    winner(person, dealer)
  end
end

def check_for_blackjack(player, dealer) # checks for blackjac and returns prompt and winner
  if blackjack?(player, dealer)
    blackjack_prompt(player, dealer)
    winner(player, dealer)
  end
end

def winner(player, dealer) # returns the player/dealer name
  if player[:hand_value] > 21
    return dealer[:name]
  elsif dealer[:hand_value] > 21
    return player[:name]
  elsif player[:hand_value] > dealer[:hand_value]
    return player[:name]
  else
    return dealer[:name]
  end
end

def display_winner(player, dealer) # displays prompt for who wins
  if winner(player, dealer) == player[:name]
    prompt "You win!"
  else
    prompt "You lost! Dealer wins!"
  end
end

def display_round(number) # displays round number
  puts"Round #{number}"
end

def update_score(player, dealer, score) # updates scores variable
  case winner(player, dealer)
  when player[:name]
    score[:human] += 1
  when dealer[:name]
    score[:computer] += 1
  end
end

def display_score(player, dealer, score) # displays score to the screen
  puts "-----------------------------------------------------"
  puts "SCORE | Player: #{score[:human]}. Dealer: #{score[:computer]}."
  puts "-----------------------------------------------------"
end

round = 0
scores = {human: 0, computer: 0}
loop do
  # game initialization
  round += 1

  deck = DECK
  human = { name: "Player", hand: [], hand_value: 0, }
  computer = { name: "Dealer", hand: [], hand_value: 0 }
  system 'clear'
  display_round(round)
  display_score(human, computer, scores)

  loop do
    # inital hands are delt
    deal_initial_hands!(deck, human, computer)
    prompt "You have: #{human[:hand][0].to_s.capitalize} and #{human[:hand][1].to_s.capitalize}."
    prompt "Dealer has: #{computer[:hand][1].to_s.capitalize} and a unknown card."
    display_hand_value(human)

    # check to see if anyone has blackjack
    break if check_for_blackjack(human, computer)

    # player hit or stay loop
    hit_stay_loop(deck, human, computer)
    display_hand_value(human)

    # checking to see if player has blackjack or busted?
    break if check_for_blackjack(human, computer) || check_for_bust(human, computer)

    # dealer hit or stay loop
    dealer_hit_or_stay(deck, human, computer)
    break if check_for_blackjack(human, computer) || check_for_bust(human, computer)

    # if player and dealer both stay and don't bust or blackjack evaluate who wins
    winner(human, computer)
    break
  end

  # display winner and prompt to play again
  display_winner(human, computer)
  update_score(human, computer, scores)
  if scores[:human] == 5
    prompt "Player wins it all with 5 wins!"
    break
  end
  if scores[:computer] == 5
    prompt "Dealer wins it all with 5 wins!"
    break
  end
  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing 21!"

