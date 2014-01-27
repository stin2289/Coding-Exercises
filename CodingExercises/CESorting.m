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


//9.2
//- Write a method to sort an array of strings so that all the anagrams are next to each other
+ (NSArray *)orderAnagramsWithInputArray:(NSArray *)inputArray
{
    NSArray *array = [inputArray copy];
    NSMutableDictionary *stringsDictionary = [NSMutableDictionary new];
    
    //loop through the inputArray
    for(int i = 0; i < [array count]; i++){
        
        NSString *sortedString = [self selectionSortWithInputString:array[i]];
        
        //if anagram value is created
        if(stringsDictionary[sortedString])
            //add index to array
            [stringsDictionary[sortedString] addObject:@(i)];
        else
            //create array and insert current index
            stringsDictionary[sortedString] = [NSMutableArray arrayWithObjects:@(i),nil];
        
    }
    
    //create new array w/ anagrams together
    NSMutableArray *sortedArray = [NSMutableArray new];
    
    //loop through dictionary keys
    for(NSString *key in stringsDictionary)
        //look through array at key value
        for(NSNumber *index in stringsDictionary[key])
            [sortedArray addObject:array[[index intValue]]];
    
    return [sortedArray copy];
    
}

//selection sort string
+ (NSString *)selectionSortWithInputString:(NSString *)inputString
{
    NSMutableString *string = [inputString mutableCopy];
    
    //loop through string n times
    for(int i = 0; i < [string length] - 1; i++){
        
        NSString *smallestChar = [string substringWithRange:NSMakeRange(i,1)];
        int indexOfSmallestChar = i;
        
        //loop through remainder of string
        for(int j = i+1; j < [string length]; j++){
            
            NSString *currentChar = [string substringWithRange:NSMakeRange(j,1)];
            
            //if the smallestChar is more than the currentChar
            if([smallestChar compare:currentChar] == NSOrderedDescending){
                //set new smallest char
                smallestChar = currentChar;
                indexOfSmallestChar = j;
            }
            
            
        }
        
        //if smallestChar does not equal char at current index
        if(i != indexOfSmallestChar){
            
            /*
             swap characters
             */
            NSString *temp = [string substringWithRange:NSMakeRange(i,1)];
            [string replaceCharactersInRange:NSMakeRange(i, 1) withString:smallestChar];
            [string replaceCharactersInRange:NSMakeRange(indexOfSmallestChar, 1) withString:temp];
            
        }
        
    }
    
    return string;
    
}

//binary search of array
+ (NSInteger)returnIndexOfTarget:(NSNumber *)target withArray:(NSArray *)array
{
    NSInteger low = 0;
    NSInteger high = [array count];
    
    while(low + 1 < high){
        
        NSInteger test = (low + high)/2;
        
        //if value at test is greater than target
        if([array[test] compare:target] == NSOrderedDescending)
            high = test;
        else
            low = test;
        
    }
    
    if(array[low] == target)
        return low;
    
    
    return -1;

}


//9.3
//- Given a sorted array of n integers that has been rotated an unknown number of times
//give an O(log n) algorithm that finds an element in the array.
//You may assume that the array was originally sorted in increasing order
+ (int)binarySearchWithArray:(NSArray *)array lower:(int)lower upper:(int)upper target:(NSNumber *)target
{
    while(lower <= upper){
        
        int m = (lower + upper)/2;
        
        //target is equal to array[m]
        if([target compare:array[m]] == NSOrderedSame)
            return m;
        //array[lower] is less than or equal to array[m]
        else if([array[lower] compare:array[m]] == NSOrderedAscending || [array[lower] compare:array[m]] == NSOrderedSame){
            
            //target is greater than array[m]
            if([target compare:array[m]] == NSOrderedDescending)
                lower = m + 1;
            //target is greater than or equal to array[lower]
            else if([target compare:array[lower]] == NSOrderedDescending || [target compare:array[lower]] == NSOrderedSame)
                upper = m - 1;
            else
                lower = m + 1;
            
        }
        //target is less than array[m]
        else if([target compare:array[m]] == NSOrderedAscending)
            upper = m - 1;
        //target is less or equal to array[upper]
        else if([target compare:array[upper]] == NSOrderedAscending || [target compare:array[upper]] == NSOrderedSame)
            lower = m + 1;
        else
            upper = m - 1;
        
    }
        
    return -1;

}


//9.5
//- Given a sorted array of strings which is interspersed with empty strings, write a method to find the location of a given string
//Example: find “ball” in [“at”, “”, “”, “”, “ball”, “”, “”, “car”, “”, “”, “dad”, “”, “”] will //return 4
+ (int)returnIndexOfTarget:(NSString *)target interspersedArray:(NSArray *)interspersedArray
{
    
    int lower = 0;
    int upper = [interspersedArray count] - 1;
    
    //while lower is less than upper
    while(lower < upper - 1){
        
        int m = (lower + upper)/2;
        
        //shift lower off empty string
        while([interspersedArray[lower] length] == 0 && lower < m)
            lower++;
        
        //shift upper off empty string
        while([interspersedArray[upper] length] == 0 && upper > m)
            upper--;
        
        //shift m off empty string
        while([interspersedArray[m] length] == 0 && m > lower)
            m--;
        
        //if string at lower index is equal to target
        if([target isEqualToString:interspersedArray[m]])
            return m;
        else if([target isEqualToString:interspersedArray[lower]])
            return lower;
        else if([target isEqualToString:interspersedArray[upper]])
            return upper;
        //if lower is greater than m
        else if([interspersedArray[lower] compare:interspersedArray[m]] == NSOrderedDescending)
            lower = m;
        //if upper is less than m
        else if([interspersedArray[upper] compare:interspersedArray[m]] == NSOrderedAscending)
            upper = m;
        else{
            if([target compare:interspersedArray[m]] == NSOrderedDescending)
                lower = m;
            else
                upper = m;
        }
        
    }
    
    //if string at index is equal to target
    if([interspersedArray[lower] isEqualToString:target])
        return lower;
        
    return -1;
        
}



@end
