# rps.rb
require 'pry'
class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def winner?
    if human.move > computer.move
      :human
    elsif human.move < computer.move
      :computer
    else
      :tie
    end
  end

  def display_winner
    if winner? == :human
      puts "#{human.name} won!"
    elsif winner? == :computer
      puts "#{computer.name} won!"
    else winner? == :tie
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name} Score: #{human.score} #{computer.name} Score: #{computer.score}"
  end

  def update_score
    if winner? == :human
      human.score =+ 1
    elsif winner? == :computer
      computer.score =+ 1
    else
      nil
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      @human.choose
      @computer.choose
      display_moves
      display_winner
      update_score
      display_score
      binding.pry
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
