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

@end
