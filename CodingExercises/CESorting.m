//
//  CESorting.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/23/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CESorting.h"

@implementation CESorting


//9.1
//- You are given two sorted arrays, A and B, and A has a large enough buffer at the end to hold B
//Write a method to merge B into A in sorted order.
+ (NSArray *)mergeTwoArraysWithA:(NSArray *)a b:(NSArray *)b
{
    int k = 0;
    int i = 0;
    int j = 0;
    
    NSMutableArray *c = [NSMutableArray new];
    
    // Start comparing from the first element and merge a and b
    while(i < [a count] && j < [b count]){
        
        //a < b
        if([a[i] compare:b[j]] == NSOrderedAscending)
            c[k++] = a[i++];
        else
            c[k++] = b[j++];
        
    }
    
    //if there's values left in a, add
    while(i < [a count]){
        c[k++] = a[i++];
    }
    
    //if there's values left in b, add
    while(j < [b count]){
        c[k++] = b[j++];
    }
    
    return c;
    
}

//merge sort
+ (NSArray *)mergeSortArrayWithInputArray:(NSArray *)inputArray
{
    //create initial condition
    NSMutableArray *outputArray = [NSMutableArray new];
    //create array of all elements
    for(NSNumber *number in inputArray)
        [outputArray addObject:@[number]];
    
    //create first element in dictionary of arrays
    NSMutableArray *arrayOfArrays = [[NSMutableArray alloc] initWithObjects:outputArray, nil];
    
    int i = 1;
    
    //i is size of arrays that get merged
    while([arrayOfArrays[i-1] count] > 1){
        
        [arrayOfArrays addObject:[NSMutableArray new]];
        
        //index of the start of the arrays to get merged
        for(int j = 0; j < [arrayOfArrays[i-1] count] - 1; j+=2){
            NSArray *a = arrayOfArrays[i-1][j];
            NSArray *b = arrayOfArrays[i-1][j+1];
            
            NSArray *c = [self mergeTwoArraysWithA:a b:b];
            [arrayOfArrays[i] addObject:c];
            
        }
    
        i++;
        
    }
    
    return arrayOfArrays[i-1][0];
    
}



@end
