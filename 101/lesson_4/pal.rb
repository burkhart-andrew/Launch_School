# write a method to determine if a word is a palindrome

# palindrome is a word that is the same forward as it is the backwards
# this means the first letter is the same as the last letter and so on...

# compare the associated letters in a word or phrase to check if it
# is a palindrome
# pal method will return true or false using the word or pharse as an
# argument

def pal?(input)
  pal_inner?(input.delete(' '))
end

def pal_inner?(input)
  number = input.size
  if input[0] != input[number-1]
    false
  elsif number < 2
    true
  else
    pal_inner?(input[1..-2])
  end
end

def sample_rec(something)
  if base_case?(something)
    whatever
  else
    sample_rec(something_smaller)
  end
end
