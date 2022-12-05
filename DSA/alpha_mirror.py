"""
:type  param_1: {String}
:rtype: string
"""

def checkCase(res, start, end, ch):
    rev = 25;
    while (start <= end):
        if (ord(ch) == start):
            res.append(chr(ord(ch) + rev))
        rev -= 2;
        start += 1;


def alpha_mirror(str):
    res = []
    for ch in str:
        if (ord(ch) >= 97 and ord(ch) <= 122):
            checkCase(res, 97, 122, ch)
        elif (ord(ch) >= 65 and ord(ch) <= 90):
            checkCase(res, 65, 90, ch)
        else:
            res.append(ch)
    return "".join(res)



# str = "Nb slihv rh Znzarmt."
# str = "My horse is Amazing."
# str = "abc"
print(alpha_mirror(str))