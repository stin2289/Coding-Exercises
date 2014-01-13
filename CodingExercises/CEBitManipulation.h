//
//  CEBitManipulation.h
//  CodingExercises
//
//  Created by Austin Marusco on 1/12/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CEBitManipulation : NSObject


//5.1
//- You are given two 32-bit numbers, N and M, and two bit positions, i and j
//Write a method to set all bits between i and j in N equal to M (e g , M becomes a substring of N //located at i and starting at j)
//EXAMPLE:
//Input:  N = 10000000000
//M = 10101
//i = 2
//j = 6
//Output: N = 10001010100
+ (int)insertBitsWithN:(int)n m:(int)m i:(int)i j:(int)j;

@end
