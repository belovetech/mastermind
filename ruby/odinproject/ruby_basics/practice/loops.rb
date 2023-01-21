#!/usr/bin/ruby
# LOOP


# i = 1
# while i <= 10 do
#     puts "i is #{i}"
#     i += 1
# end
    

# puts "--------------"
# i = 10
# until i <= 0 do
#     puts "i is #{i}"
#     i -= 1
# end

# puts "Do you love me?"
# while gets.chomp.downcase != "yes" do
#     puts "Do you love me?"
# end

# until gets.chomp == "yes" do
#     puts "Will you go and see movie with me?"
# end


# (0..5) inclusive range  0 1 2 3 4 5
# (0...5) excludive range 0 1 2 3 4
for i in (0...5)
    puts "Counter #{i}"
end

# Times loop

5.times do
    puts "Life of a programmer"
end

puts "----------------------"

5.times do |num|
    puts "#{num} Don't"
end

5.upto(10)   { |num| puts "#{num} "}
10.downto(5) { |num| puts "#{num} "}