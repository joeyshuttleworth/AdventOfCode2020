#!/bin/env python3
import numpy as np

def main(xdiff, ydiff):
    with open("data/day3.txt", "r") as fopen:
        lst = fopen.readlines()
        y=0
        x=0
        width = len(lst[0])-1
        score=0
        while(y < len(lst)):
            vals = list(lst[y])
            if vals[x%width] =='#':
                score+=1
                vals[x%width]='X'
            else:
                vals[x%width]='O'
            lst[y] = "".join(vals)
            x = (x+xdiff)%width
            y = y+ydiff
    print(score)
    return(score)

if __name__ == "__main__":
    main(3,1)
    print(np.product([main(a,b) for [a,b] in [[1,1],[3,1],[5,1],[7,1],[1,2]]]))

