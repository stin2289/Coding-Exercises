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


//8.2
//- Imagine a robot sitting on the upper left hand corner of an NxN grid
//The robot can only move in two directions: right and down
//How many possible paths are there for the robot?
+ (NSInteger)possibleMovesInGridWithSizeN:(NSInteger)n xPosition:(NSInteger)xPosition yPosition:(NSInteger)yPosition
{
    NSInteger sum = 0;
    
    //if x isn’t at max length, move right
    if(xPosition < n-1)
        sum += 1 + [self possibleMovesInGridWithSizeN:n xPosition:xPosition+1 yPosition:yPosition];
    
    //if y isn’t at max length, move down
    if(yPosition < n-1)
        sum += 1 + [self possibleMovesInGridWithSizeN:n xPosition:xPosition yPosition:yPosition+1];
    
    return sum;
    
}



//8.3
//- Write a method that returns all subsets of a set
+ (NSMutableArray *)returnSubsetsOfSet:(NSSet *)set
{
    NSMutableArray *subsets = [NSMutableArray new];
    [subsets addObject:set];
    
    for(id object in set){
        
        //if the set size is greater than 1
        if([set count] > 1){
            
            NSMutableSet *newSet = [NSMutableSet setWithSet:set];
            [newSet removeObject:object];
            
            //find subsets of set w/o current object
            NSMutableArray *newSubsets = [self returnSubsetsOfSet:newSet];
            [subsets addObjectsFromArray:newSubsets];
            
        }
        
    }
    
    return subsets;
    
}


//8.4
//- Write a method to compute all permutations of a string
+ (NSMutableArray *)getPermutationsOfString:(NSString *)string
{
    NSMutableArray *permutations = [[NSMutableArray alloc] init];
    
    if(!string) //error case
        return nil;
    else if([string length] == 0){ //base case
        [permutations addObject:@""];
        return permutations;
    }

    NSString *first = [string substringToIndex:1];
    NSString *remainder = [string substringFromIndex:1];

    NSMutableArray *words = [self getPermutationsOfString:remainder];

    //add character to permutations of word
    for(NSString *word in words)
        for(int j = 0; j <= [word length]; j++)
            [permutations addObject:[self insertChar:first inWord:word atIndex:j]];


    return permutations;
}

+ (NSString *)insertChar:(NSString *)c inWord:(NSString *)word atIndex:(int)index
{
    NSString *start = [word substringToIndex:index];
    NSString *end = [word substringFromIndex:index];
    return [NSString stringWithFormat:@"%@%@%@",start,c,end];
}

@end
