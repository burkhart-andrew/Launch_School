# reverse will take a data set and return a new array with elements in reverse order

# 

def reverse(array)
  new_array = []
  number = array.count
  array.each.with_index {|element, index| new_array[number - index - 1] = element}
  new_array
end
