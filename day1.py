#!/bin/env python3

def main1():
    with open("data/day1.txt", "r") as fopen:
        lst = fopen.readlines()
        lst=sorted([int(val) for val in lst])

    for i in reversed(lst):
        for j in lst:
            if i + j == 2020:
                print(i*j)
                return(i*j)
            elif i + j > 2020:
                break
def main2():
    with open("data/day1.txt", "r") as fopen:
        lst = fopen.readlines()
        lst=sorted([int(val) for val in lst])

    for i in reversed(lst):
        for j in lst:
            if i + j >= 2020:
                break
            for k in lst:
                if k == j:
                    break
                elif i + j + k == 2020:
                    print(i*j*k)
                    return(i*j*k)
                elif i + j + k > 2020:
                    break


if __name__ == "__main__":
    main1()
    main2()
