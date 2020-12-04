#!/bin/env python3


def main():
    with open("data/day2.txt", "r") as fopen:
        lst = fopen.readlines()
        lst= sorted([str.split() for str in lst])
        score = 0
        for line in lst:
           lower, upper = [int(val) for val in line[0].split('-')]
           chr = line[1][0]
           password = line[2]
           count = password.count(chr)
           if count >= lower and count <= upper:
               score += 1
    print(score)

def main2():
    with open("data/day2.txt", "r") as fopen:
        lst = fopen.readlines()
        lst= sorted([str.split() for str in lst])
        score = 0
        for line in lst:
           lower, upper = [int(val) for val in line[0].split('-')]
           chr = line[1][0]
           password = line[2]
           if (password[lower-1] == chr) != (password[upper-1] == chr):
               score+=1
    print(score)


if __name__ == "__main__":
    main()
    main2()
