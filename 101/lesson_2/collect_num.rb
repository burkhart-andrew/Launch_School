def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

number = ''
def collect_num(instance)
  loop do
  puts "Please enter the #{instance} number:"
  number = gets.chomp
    if number?(number) ==nil?
      puts "Hmm... that doesn't look like a valid number"
    else
      return number
      break
    end
  end
end
