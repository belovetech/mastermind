#!/usr/bin/ruby
# HASH
hash = Hash.new

# print hash.methods

puts hash.empty?

h1 = {key1: "1", key2: "2"}
h2 = {key1: "1", key2: "2"}
puts h2.eql?h1

puts h1[:key1]

puts h1.key?(:key2)

puts h2.fetch(:key1)

puts h1.equal?h2


my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}

# p my_hash

# p my_hash[:an array]

my_hash = {
  "a random word": "ahoy",
  "Dorothy's math test score": 94,
  "an array": [1, 2, 3],
  "an empty hash within a hash": {}
}

p my_hash

p my_hash[:"an array"]


shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}


shoes[:casual] = "snikers"
p shoes.fetch(:casual)

shoes.delete(:casual)

p shoes

p shoes.keys
p shoes.values

hash1 = {
    key1: 1,
    key2: 2,
    key3: 3
}

hash2 = {
    key4: 4,
    key5: 5,
    key2: "2"
}

p hash1.merge(hash2)


# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

p american_cars[:ford]
p japanese_cars[:honda]