//
//  CEBitManipulation.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/12/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CEBitManipulation.h"

@implementation CEBitManipulation


//5.1
//- You are given two 32-bit numbers, N and M, and two bit positions, i and j
//Write a method to set all bits between i and j in N equal to M (e g , M becomes a substring of N //located at i and starting at j)
//EXAMPLE:
//Input:  N = 10000000000
//M = 10101
//i = 2
//j = 6
//Output: N = 10001010100
+ (int)insertBitsWithN:(int)n m:(int)m i:(int)i j:(int)j
{
    //left shift m by i
    m <<= i;

    //create left of mask
    int left = INT_MAX << j;
    //create right of mask
    int right = pow(2, i) - 1;
    //create mask
    int mask = left | right;
    
    //reset specified bits to 0
    n &= mask;
    
    //set n bits to shifted m
    n |= m;
    
    return n;
    
}


@end
