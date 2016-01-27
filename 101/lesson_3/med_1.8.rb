def titelize!(string)
    arr = string.downcase.split
    arr = arr.each { |word| print word.capitalize!, " "}
end

s = "An array of strings"
b = "new array of stings"




# solution
def titleize(words)
    words.split.map { |word| word.capitalize }.join(' ')
end

titelize!(s)
titleize(b)

puts s
print b