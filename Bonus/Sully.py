if __name__ == "__main__":
    i = 5
    string = """if __name__ == %c__main__%c:%c    i = %d%c    string = %c%c%c%s%c%c%c%c    for index, elem in enumerate((%cSully_{}.py%c.format(x) for x in range(i+1))):%c        try:%c            with open(elem, %cw%c) as sully: sully.write((string %% ('"', '"', chr(0x0A), index, chr(0x0A), '"', '"', '"', string, '"', '"', '"', chr(0x0A), '"', '"', chr(0x0A), chr(0x0A), '"', '"', chr(0x0A), chr(0x0A), chr(0x0A))))%c        except:%c            pass%c"""
    for index, elem in enumerate(("Sully_{}.py".format(x) for x in range(i+1))):
        try:
            with open(elem, "w") as sully: sully.write((string % ('"', '"', chr(0x0A), index, chr(0x0A), '"', '"', '"', string, '"', '"', '"', chr(0x0A), '"', '"', chr(0x0A), chr(0x0A), '"', '"', chr(0x0A), chr(0x0A), chr(0x0A))))
        except:
            pass
