
"""
:type  param_1: {String}
:rtype: string
"""
def last_word(text):
    if (text == ""):
        return ""
    
    new_str = ""
    text = text.strip()
    length = len(text)
    for i in range(length-1, 0, -1):
        if  (text[i] == " " or text[i] == "," or text[i] == "\t"):
            return new_str[::-1]
        else:
            new_str += text[i]
            
            
text = "    lorem, ipsum "
print(last_word(text))
