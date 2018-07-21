from os import system
if __name__ == "__main__":
    i = 5
    if (i <= 0): exit()
    if (__file__ != "Sully.py"): i-= 1
    string = """from os import system{0}if __name__ == {1}__main__{1}:{0}    i = {2}{0}    if (i <= 0): exit(){0}    if (__file__ != {1}Sully.py{1}): i-= 1{0}    string = {1}{1}{1}{3}{1}{1}{1}{0}    try:{0}        with open({1}Sully_{1} + str(i) + {1}.py{1}, {1}w{1}) as sully: sully.write(string.format(chr(0x0A), '"', i, string)){0}        system({1}python3 Sully_{1} + str(i) + {1}.py{1}){0}    except:{0}        pass{0}"""
    try:
        with open("Sully_" + str(i) + ".py", "w") as sully: sully.write(string.format(chr(0x0A), '"', i, string))
        system("python3 Sully_" + str(i) + ".py")
    except:
        pass
