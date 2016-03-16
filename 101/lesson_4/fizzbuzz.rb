#

def fizzbuzz(start_num, end_num)
  fizzbuzz_array = []
  array = (start_num..end_num).to_a
  array.select do |num|
    if num%3 == 0 && num%5 == 0
      fizzbuzz_array << "FizzBuzz"
    elsif num%3 == 0
      fizzbuzz_array << "Fizz"
    elsif num%5 == 0
      fizzbuzz_array << "Buzz"
    else
      fizzbuzz_array << num
    end
  end
  puts fizzbuzz_array.join(",  ")
end


fizzbuzz(1, 15)

