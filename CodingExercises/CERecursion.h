//
//  CERecursion.h
//  CodingExercises
//
//  Created by Austin Marusco on 1/19/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CERecursion : NSObject

//8.1
//- Write a method to generate the nth Fibonacci number
//1,1,2,3,5,8,13,21,34
//adds previous two numbers to create next number
+ (NSInteger) generateNthFibonacciNumberWithN:(NSInteger)n;

//8.2
//- Imagine a robot sitting on the upper left hand corner of an NxN grid
//The robot can only move in two directions: right and down
//How many possible paths are there for the robot?
+ (NSInteger)possibleMovesInGridWithSizeN:(NSInteger)n xPosition:(NSInteger)xPosition yPosition:(NSInteger)yPosition;

//8.3
//- Write a method that returns all subsets of a set
+ (NSMutableArray *)returnSubsetsOfSet:(NSSet *)set;

//8.4
//- Write a method to compute all permutations of a string
+ (NSMutableArray *)getPermutationsOfString:(NSString *)string;



@end
