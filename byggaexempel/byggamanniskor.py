

def main():
    writeToOutput(101)

def writeToOutput(man):
     with open ("test.pl","w") as r:
        a = 1
        while man > 0:
            r.write("person(p%s).\n" %man)
            man = man -1
        r.write("\n")
        r.write("\n")

        b = 5
        while (b < 101):
            c = b -1
            a = 4
            while a > 0:
                r.write("knows(p%s,p%s).\n" %(b,c))
                c = c-1
                a = a - 1
            r.write("\n")
            r.write("\n")
            b = b+5
        r.write("\n")
        r.write("%""Spindeln i natet\n")
        r.write("\n")
        y = 5
        while (y < 101) :
            r.write("knows(p%s,p%s).\n" %(101,y))
            y = y + 5



        # x = 1
        # while (x < 2):
        #     y = 1
        #     while (y<20):
        #         r.write("knows(p%s,p%s).\n" %(x,y))
        #         y = y+1
        #     x = x+1




main()
