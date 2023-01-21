#!/usr/bin/ruby

# Creating Arrays

arr = Array.new
p arr

arr = Array.new(3)
p arr

arr = Array.new(3, true)
p arr

arr = Array.new(4) {Hash.new}
p arr

newArr = Array.new(5) {|i| i.to_s}
p newArr

puts
empty_array = Array.new(3) {Array.new(3)}
p empty_array

puts
h = {:a => "b", :c => "d"}
hash_to_array = Array(h)
p hash_to_array
puts


# Accessing Elements
arr = [1, 2, 3, 4, 5, 6]
puts arr[-2]
puts arr.at(3)


arr = ['a', 'b', 'c', 'd', 'e', 'f']
puts arr.fetch(100, "Oops!")
# puts arr.fetch(100)


arr = [1, 2, 3, 4, 5, 6]
puts arr.first
puts arr.last
p arr.first(2)
p arr.last(3)

p arr.take(3)
p arr.drop(3)

puts

# Obtaining Information about an Array
browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
puts browsers.length
puts browsers.count
puts browsers.size

puts browsers.empty?
puts browsers.include?("Samsung")

# Adding Items to Arrays
arr = [1, 2, 3, 4]
p arr.push(5)
p arr << 6
p arr.unshift(0)
p arr.insert(2, "Bala Blu")
p arr.insert(3, 'orange', 'pear', 'grapefruit')
puts arr.length
puts

# Removing Items from an Array
arr =  [1, 2, 3, 4, 5, 6]
puts arr.pop()
puts arr.shift()
puts arr.delete_at(2)
arr.push(2, 2)
arr.delete(2)
p arr

puts
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
p arr.compact
p arr
p arr.compact!
p arr

arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
p arr.uniq




# # String array
# str_array = ["This", "is", "a", "small", "array"]
# puts str_array[-2]
# print str_array.first(1)
# print str_array.first(2)
# print str_array.last(1)
# print str_array.last(3)

# puts

# # Number array
# num_array = [1, 2]
# num_array.push(3, 4)
# num_array << 5  # append 5
# print num_array

# puts num_array.pop


# num_array = [1, 2, 3, 4, 5, 6]
# print num_array.shift(3)
# num_array.unshift(1, 2)

# print num_array
# puts 

# a = [1, 2, 3]
# b = [3, 4, 5]

# print a + b
# print a.concat(b)

# print [1, 1, 1, 2, 2, 3, 4] - [1, 4]

# puts "\n"

# new_array = [1, 3, 5]













# puts new_array.empty?
# puts new_array.length
# puts new_array.include?(5)

# puts new_array[2]

# print new_array.reverse



# puts "\n"