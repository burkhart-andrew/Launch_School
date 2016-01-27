greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#grettings returns a: 'hi there' because 'there' was appended to the same object id as 'hi' in greetings