
def main():
    whritetooutput(40)


def manniska(man):
    a = "person(p", man ,").\n"
    return a

def whritetooutput(man):
     with open ("test.pl","w") as r:
        a = 1
        while man > 0:

            #r.write("person(p")
            #r.write(man)
            #r.write(").")
            r.write("person(p%s).\n" %man)
            man = man -1
        x = 1
        while (x < 40):
            y = 1
            while (y<20):
                r.write("knows(p%s,p%s).\n" %(x,y))
                y = y+1
            x = x+1




main()