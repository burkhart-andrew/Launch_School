require 'pry'
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze # diagonal

player_score = 0

computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd) # rubocop:disable Metrics/AbcSize
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
  if (1..9).cover?(choice) && empty_squares(brd).include?(choice)
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

# TODO: return space_id rather than [space_id]
def computer_defense(brd)
  lines = strategic_lines(brd, PLAYER_MARKER)
  if lines.empty?
    nil
  else
    empty_squares_in_lines(brd, lines)
  end
end

def computer_offense(brd)
  # binding.pry
  lines = strategic_lines(brd, COMPUTER_MARKER)
  if brd[5] == INITIAL_MARKER
    [5]
  elsif lines.empty?
    nil
  else
    empty_squares_in_lines(brd, lines)
  end
end

def strategic_lines(brd, player_marker_type) # returns array with at risk lines
  WINNING_LINES.select do |line|
    brd.values_at(line[0], line[1], line[2]).count(player_marker_type) == 2 &&
      brd.values_at(line[0], line[1], line[2]).include?(INITIAL_MARKER)
  end
end

# def line_has_two_player_marks?(brd)
#   WINNING_LINES.any? do |line|
#     brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2
#   end
# end

def empty_squares_in_lines(brd, lines)
  lines.map do |line|
    line.detect do |square_id|
      brd.values_at(square_id).include?(INITIAL_MARKER)
    end
  end
end

def player_place_peice!(square, brd) # marks player choice on the board
  brd[square] = PLAYER_MARKER
end

def computer_place_peice!(brd)
  if computer_offense(brd)
    brd[computer_offense(brd).sample] = COMPUTER_MARKER
  elsif computer_defense(brd)
    brd[computer_defense(brd).sample] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
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

def display_score(player, computer)
  puts "Player Score: #{player}. Computer Score: #{computer}"
end

if __FILE__ == $PROGRAM_NAME
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
      if detect_winner(board) == 'Player'
        player_score += 1
      elsif detect_winner(board) == "Computer"
        computer_score += 1
      end
    else
      prompt "It's a tie!"
    end
    display_score(player_score, computer_score)
    if player_score == 5 || computer_score == 5
      break
    end
    prompt "Play again? (yes or no)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  prompt "Thanks for playing Tic Tac Toe!"
end
