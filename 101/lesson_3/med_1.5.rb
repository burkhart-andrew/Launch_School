def factors(number)
    dividend = number
    divisors = []
    while dividend > 0 do
        divisors << number / dividend if number % dividend == 0
        dividend -= 1
    end
   
    # if number > 0
    #     begin
    #         divisors << number / dividend if number % dividend == 0
    #         dividend -= 1
    #     end until dividend == 0
    # else
    #     puts "Try Another Number"
    # end
    divisors
end

n =  factors(10)
print n
print "**********"
print factors(0)
print "**********"
print factors(-3)
print "**********"
print factors(2)
