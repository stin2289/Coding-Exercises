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

//5.2
//Given a (decimal - e.g. 3.72)number that is passed in as a string
//print the binary representation
//If the number can not be represented accurately in binary, print “ERROR”
+ (NSString *)binaryRepresentationOfString:(NSString *)string;

//5.3
//- Given an integer, print the next smallest and next largest number that have the same number of 1 bits in their binary representation
+ (NSArray *)returnNextLargestAndSmallestIntegersWithNumber:(NSInteger)number;

@end
