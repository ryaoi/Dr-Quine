def fake_define(): pass
def fake_define2(): pass
def f():
    """
    Comment!
    """
    if __name__ == "__main__":
        grace = """def fake_define(): pass%cdef fake_define2(): pass%cdef f():%c    %c%c%c%c    Comment!%c    %c%c%c%c    if __name__ == %c__main__%c:%c        grace = %c%c%c%s%c%c%c%c        try:%c            with open(%cGrace_kid.py%c, %cw%c) as kid: kid.write((grace %% (chr(0x0A), chr(0x0A), chr(0x0A), '"', '"', '"', chr(0x0A), chr(0x0A), '"', '"', '"', chr(0x0A), '"', '"', chr(0x0A), '"', '"', '"', grace, '"', '"', '"', chr(0x0A), chr(0x0A), '"', '"', '"', '"', chr(0x0A), chr(0x0A), chr(0x0A), chr(0x0A))))%c        except:%c            pass%cf()%c"""
        try:
            with open("Grace_kid.py", "w") as kid: kid.write((grace % (chr(0x0A), chr(0x0A), chr(0x0A), '"', '"', '"', chr(0x0A), chr(0x0A), '"', '"', '"', chr(0x0A), '"', '"', chr(0x0A), '"', '"', '"', grace, '"', '"', '"', chr(0x0A), chr(0x0A), '"', '"', '"', '"', chr(0x0A), chr(0x0A), chr(0x0A), chr(0x0A))))
        except:
            pass
f()
