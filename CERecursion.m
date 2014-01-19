//
//  CERecursion.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/19/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CERecursion.h"

@implementation CERecursion


//8.1
//- Write a method to generate the nth Fibonacci number
//1,1,2,3,5,8,13,21,34
//adds previous two numbers to create next number
+ (NSInteger) generateNthFibonacciNumberWithN:(NSInteger)n
{
    //if n is less than 2, return 1
    if(n < 2)
        return 1;
    
    //add two previous numbers and return
    return [self generateNthFibonacciNumberWithN:n-1] + [self generateNthFibonacciNumberWithN:n-2];
    
}

@end
