def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if !is_a_number?(word)
  end
  return true
end

def ip?(input_string)
  dot_separated_words = input_string.split(".") #YEILDS AN ARRAY
  if dot_separated_words.count == 4 #MAKES SURE ONLY 4 PARTS IN THE ARRAY
	  while dot_separated_words.size > 0 do #CHECKS EACH WORD TO MAKE SURE IT IS A NUMBER
	    word = dot_separated_words.pop
	    break if !is_a_number?(word) #BREAKS IF IT IS A WORD
	  end
  else #IF MORE OR LESS THAN 4 PARTS IN ARRAY => FALSE
  	false
end

def ip?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_words.all? {|x| is_a_number?(x)} && dot_separated_words.count == 4
end

def is_a_number?(word)
  !!word.match(/\A[0-9]+\z/)
end

#need to verify each object in the array is a number
#we need to pass each object into is_a_number? and have it evaluate true/false