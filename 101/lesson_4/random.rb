def joinor(array, separator = ',', word = 'or')
	array.join(separator + ' ').insert(-2, word + ' ')
end

take an array
combine all objects
one object to a string

def joins(array)
	a = ''
	a = array.to_s
	a.delete!('[')
	a.delete!(']')
	a.delete!(',')
	a.delete!(' ')
	a.tr!('"', '')
	return a
end

def join(array)
	array.to_s.delete('[').delete!(']').delete!(',').delete!(' ').tr!('"', '')
end

def array_like_strings_test
  if join(["[a, b, c]", 1], "~") == "[a, b, c]~1"
    :passes
else
  :fails
end

def join(array, separator = "")
	joined = ""
	array.each {|x| joined << (x.to_s + separator)}
	joined.chomp(separator)
end


if imediate threat true
	square = the WINNING_LINE with the threat that equals " 

	board => {1=>" ", 2=>" ", 3=>"X", 4=>"X", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
