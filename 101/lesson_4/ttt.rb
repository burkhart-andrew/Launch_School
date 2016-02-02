require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
end

def initialize_board # creating new board
  new_board = {}
  (1..9).each { |number| new_board[number] = INITIAL_MARKER }
  new_board
end

def joinor(array, separator = ',', word = 'or')
  if array.count > 2
    array.join(separator + ' ').insert(-2, word + ' ')
  else
    array.join(separator + ' ')
  end
end

def player_turn(brd) # returns player answer as integer
  prompt "What box would you like to mark: #{joinor(empty_squares(brd))}?"
  answer = gets.chomp.to_i
  answer
end

def valid_player_choice?(choice, brd) # returns true if choice is valid
  if (1..9).include?(choice) && empty_squares(brd).include?(choice)
    return true
  elsif choice == 0 || choice > 9
    return false
  end
end

def player_answer_loop(brd) # returns player choice
  loop do
    answer = player_turn(brd)
    if valid_player_choice?(answer, brd)
      break answer
    else
      prompt "Please enter a valid choice!"
    end
  end
end

def empty_squares(brd) # displays an array of empty squares
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_place_peice!(square, brd) # marks player choice on the board
  brd[square] = PLAYER_MARKER
end

def computer_place_peice!(brd) # marks computer choice on the board
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board # board variable
  loop do
    display_board(board)
    choice = player_answer_loop(board)
    player_place_peice!(choice, board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    computer_place_peice!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  prompt "Play again? (yes or no)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!"
