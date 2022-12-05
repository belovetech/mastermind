import sys

def my_roman_numerals_converter(num):
    if (num and isinstance(num, int)):
        roman  = { 
            1: "I", 4: "IV", 5: "V", 9: "IX", 10: "X", 40: "XL", 50: "L",
            90: "XC", 100: "C", 400: "CD", 500: "D", 900: "CM", 1000: "M"
        }
        result = []
        while (num > 0):
            temp = []
            for key in roman.keys():
                if (key <= num):
                    temp.append(key)
            result.append(roman[temp[-1]])
            num -= temp[-1]
        return "".join(result)
    return None
    
def _run():
    res = my_roman_numerals_converter(int(sys.argv[1]))
    print(res)

_run();