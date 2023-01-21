#!/usr/bin/ruby
# METHODS

def greet(name = "Stranger")
    "Hey #{name}!"
end

puts greet("Beloved")
puts greet

def odd_even(number)
    unless number.is_a? Numeric
        return "A number was not entered"
    end
    
    if number % 2 == 0
        "This is an even number"
    else
        "This is an odd number"
    end
end

puts odd_even(10)
puts odd_even("10")

# PREDICATE METHODS
puts 5.even?
puts 5.odd?
puts 5.between?(10, 15)


# BANG METHODS !
greet = "HELLO WORLD!"
puts greet.downcase! #greet = greet.downcase
puts greet