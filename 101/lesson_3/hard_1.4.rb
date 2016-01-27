# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def new_uuid
	alphanumeric = ('a'..'z').to_a + (0..9).to_a
	a = Array.new(8)
		a.map! {|x| x = alphanumeric.sample}
	b = Array.new(4)
		b.map! {|x| x = alphanumeric.sample}
	c = Array.new(4)
		c.map! {|x| x = alphanumeric.sample}
	d = Array.new(4)
		d.map! {|x| x = alphanumeric.sample}
	e = Array.new(12)
		e.map! {|x| x = alphanumeric.sample}
	return "#{a.join}-#{b.join}-#{c.join}-#{d.join}-#{e.join}"
end

