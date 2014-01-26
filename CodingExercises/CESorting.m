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
    
    return [c copy];
    
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
    
    return [arrayOfArrays[i-1][0] copy];
    
}

//bubble sort
+ (NSArray *)bubbleSortArrayWithInputArray:(NSMutableArray *)inputArray
{
    //loop n number of times
    for(int i = 0; i < [inputArray count]; i++)
        //nested loop through n - 1 times
        for(int j = 0; j < [inputArray count] - 1; j++)
            //if j > j+1
            if([inputArray[j] compare:inputArray[j+1]] == NSOrderedDescending){
                //swap values
                NSNumber *temp = inputArray[j+1];
                inputArray[j+1] = inputArray[j];
                inputArray[j] = temp;
            }
            
    
    return [inputArray copy];
}

//selection sort
+ (NSArray *)selectionSortArrayWithInputArray:(NSMutableArray *)inputArray
{
    int smallestNumberIndex;
    
    //loop n number of times
    for(int i = 0; i < [inputArray count] - 1; i++){
        
        //set smallest number equal to the first element in the current loop
        smallestNumberIndex = i;
        
        //loop through the remaining values
        for(int j = i; j < [inputArray count]-1; j++){
            
            //if the next value is smaller than the current smallest value
            if([inputArray[smallestNumberIndex] compare:inputArray[j+1]] == NSOrderedDescending)
                //set new smallest number index
                smallestNumberIndex = j+1;
            
        }
        
        //if the smallest number index does not equal the current index
        if(i != smallestNumberIndex){
            
            //swap current index value w/ smallest number index value
            NSNumber *tempNumber = inputArray[i];
            inputArray[i] = inputArray[smallestNumberIndex];
            inputArray[smallestNumberIndex] = tempNumber;
            
        }
        
    }
    
    return [inputArray copy];
}

//quicksort
+ (NSArray *)quickSortArrayWithInputArray:(NSMutableArray *)inputArray size:(int)size initialIndex:(int)initialIndex
{
    //NSLog(@"quickSort size:%i initialIndex:%i",size,initialIndex);
    
    //if array's size is less than 2
    if(size < 2)
        return inputArray;
    
    NSNumber *pivotValue = inputArray[arc4random() % size + initialIndex];
    int l = initialIndex;
    int u = initialIndex + size - 1;
    
    //NSLog(@"partition l:%i u:%i pivot:%@",l,u,pivotValue);
    
    while(l < u){
        
        //value at index l is less than or equal to pivot
        while([inputArray[l] compare:pivotValue] == NSOrderedAscending)
            l++;
        //while value at index u is greater than the pivot
        while([inputArray[u] compare:pivotValue] == NSOrderedDescending)
            u--;
    
        //if there are two values next to eachother that are equal
        if(abs(l-u) == 1 && [inputArray[u] isEqual:inputArray[l]]){
            l = u;
            break;
        }
        
        //if l does not equal u
        if(l != u && [inputArray[l] compare:inputArray[u]] != NSOrderedSame){
            //swap value of index l w/ value of index u
            NSNumber *tempNumber = inputArray[l];
            inputArray[l] = inputArray[u];
            inputArray[u] = tempNumber;
        }
        
    }
    
    //sort left side of partition
    [self quickSortArrayWithInputArray:inputArray size:l-initialIndex initialIndex:initialIndex];
    
    //sort right side of partition
    [self quickSortArrayWithInputArray:inputArray size:size-l+initialIndex-1 initialIndex:l+1];
    
    
    return inputArray;
}

//bucketsort
+ (NSArray *)bucketSortArrayWithInputArray:(NSMutableArray *)inputArray numberOfBuckets:(NSInteger)numberOfBuckets
{
    NSMutableArray *bucketsArray = [NSMutableArray new];
    
    //add 0s to buckets array
    for(NSInteger i = 0; i < numberOfBuckets; i++)
        [bucketsArray addObject:@0];
    
    NSInteger index = 0;
    NSInteger valueAtIndex = 0;
    
    //loop through all input array values
    for(NSInteger i = 0; i < [inputArray count]; i++){
        index = [((NSNumber *)inputArray[i]) integerValue];
        valueAtIndex = [((NSNumber *)bucketsArray[index]) integerValue];
        
        //increment bucket value by 1
        bucketsArray[index] = @(++valueAtIndex);
    }
    
    NSMutableArray *finalArray = [NSMutableArray new];
    
    NSInteger count = 0;
    
    //loop through all buckets
    for(NSNumber *bucket in bucketsArray){
        //add n number of buckets index values to array
        for(NSInteger i = 0; i < [bucket integerValue]; i++)
            [finalArray addObject:@(count)];
        
        count++;
        
    }
    
    return [finalArray copy];
}


@end
