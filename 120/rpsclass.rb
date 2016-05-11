#rpsclass.rb

require 'pry'
class Move

  ALL = ['rock', 'paper', 'scissors']

  def to_s
    self.class.name
  end
end

class Rock < Move

  def rock?
    true
  end

  def paper?
    false
  end

  def scissors?
    false
  end
  def >(other_move)
    other_move.scissors?
  end

  def <(other_move)
    other_move.paper?
  end

end

class Paper < Move

  def paper?
    true
  end

  def scissors?
    false
  end

  def rock?
    false
  end
  def >(other_move)
    other_move.rock?
  end

  def <(other_move)
    other_move.scissors?
  end

end

class Scissors < Move

  def scissors?
    true
  end

  def paper?
    false
  end

  def rock?
    false
  end

  def >(other_move)
    other_move.paper?
  end

  def <(other_move)
    other_move.rock?
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
      break if Move::ALL.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = case choice
                when 'rock' then Rock.new
                when 'paper' then Paper.new
                when 'scissors' then Scissors.new
                end

  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number5'].sample
  end

  def choose
    choice = Move::ALL.sample
    self.move = case choice
                when 'rock' then Rock.new
                when 'paper' then Paper.new
                when 'scissors' then Scissors.new
                end
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
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
