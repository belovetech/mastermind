##
##
## QWASAR.IO -- my_data_process
##
##
## @param {Integer[]} num
##
## @return {string}
##
def my_roman_numerals_converter(num)
    roman  = { 
        1 => "I", 4 => "IV", 5 => "V", 9 => "IX", 10 => "X", 40 => "XL", 50 => "L",
        90 => "XC", 100 => "C", 400 => "CD", 500 => "D", 900 => "CM", 1000 => "M"
    }

    result = Array.new 
    while (num > 0) do
        # step 1:   find highest decimal value <= numeral and the corresponding roman
        temp = Array.new
        roman.each do |decimal, numeral|
            if (decimal <= num)
                temp.push(decimal)
            end
        end
        # step 2: store the roman numeral and subtract its value from decimal
        result.push(roman[temp.last])
        num -= temp.last
    end
    return result.join
end


 res = my_roman_numerals_converter(1996)
 puts res