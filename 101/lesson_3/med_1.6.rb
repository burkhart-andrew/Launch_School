arr = [1, 2, 3, 4]

buffer = arr + [5]

p arr
p buffer

def mod(array)
    array << 5
end

p mod(arr)

p arr