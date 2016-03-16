# write a method that determines if a word is a palindrome

# make sure the first character in first string is equal to the last character in the second string. and we can delete each character until all the characters in the string are gone

worda = 'race car'

def palindrome?(word)
  string = word.delete(' ')
  while string != ''
    if string[0] == string[-1]
      string.slice!(0)
      string.slice!(-1)
      puts true
    else
      puts false
      break
    end
  end
end

puts 'test race car'
palindrome?('race car')
puts 'test racer car'
palindrome?('racer car')
puts 'test step on no pets'
palindrome?('step on no pets')
puts 'test step no an pets'
palindrome?('step no an pets')