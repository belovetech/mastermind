#!/usr/bin/ruby

puts 5.eql?(5)
puts 5.eql?(5.0)

a = 5
b = 5
puts a.equal?(b)

a = "Hey"
b = "Hey"
puts a.equal?(b)

# spaceship operator <=>
puts 5 <=> 6
puts 7 <=> 7
puts 9 <=> 8

# case statement
grade = 'F'

did_it_pass = case grade
    when 'A' then "Excellent!"
    when 'B' then "Very Good!"
    when 'C' then "Good"
    else "You are a failure!"
end

puts did_it_pass

age = 19

unless age < 18 # false
    puts "Down with such a thing!"
else
    puts "Better becareful!"
end


# Ternary operator
age = gets.to_i
response = age < 18 ? "Not eligible" : "You can vote"
puts response