#!/usr/bin/ruby
# Loop through array


# Iterating over Arrays
arr = [1, 2, 3, 4, 5]
arr.each { |el| print el -= 10, " " }
puts

words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each { |word| str += "#{word} "}
p str

arr = [1, 2, 3]
new_arr = arr.map { |el| el * 2}
p new_arr
p arr
p arr.map! { |el| 3 * el}
p arr

# Selecting Items from an Array
p "-------------------------------"
arr = [1, 2, 3, 4, 5, 6]
# Non-destructive Selection
p arr.select { |el| el > 3}
p arr.reject { |el| el < 3}
p arr.drop_while { |el| el < 3}
p arr
p "-------------------------------"
# Destructive Selection
arr.delete_if {|el| el < 4}
p arr
arr.keep_if {|el| el > 5}
p arr