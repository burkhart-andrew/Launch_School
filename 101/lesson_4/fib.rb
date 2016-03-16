# select the element out of the array if its index
# is a fibonacci number

# 1. determine if element is fib number
# 2. select fib element out of array
# 3. return a new array

# select_if_fib will take 2 arguments (array and index)
# select_if_fib will select element if index is fib
# select_if_fib will return nil if index is not fib

def fib(number)
  if number < 2
    number
  else
    fib(number - 1) + fib(number - 2)
  end
end

def fib?(number)
  n = 0
  f = fib(n)
  while f <= number
    if f == number
      return true
    else
      # Keep Going!
    end
    n += 1
    f = fib(n)
  end
  false
end

def select_if_fib(array, index)
  if fib?(index)
    array[index]
  else
    nil
  end
end