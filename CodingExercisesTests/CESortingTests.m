//
//  CESortingTests.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/23/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CESorting.h"

@interface CESortingTests : XCTestCase

@end

@implementation CESortingTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//9.1
//- You are given two sorted arrays, A and B, and A has a large enough buffer at the end to hold B
//Write a method to merge B into A in sorted order.
- (void)testSorting_testMerge
{
    
    NSArray *a = @[@1,@4,@5,@5,@11,@14];
    NSArray *b = @[@2,@3,@7,@9,@14];
    
    //sort arrays
    NSArray *c = [CESorting mergeTwoArraysWithA:a b:b];
    
    XCTAssertTrue([self arrayIsOrderedWithInputArray:c ordered:NSOrderedAscending],@"array is not in ascending order");
    
}

//test merge sort
- (void)testSorting_testMergeSort
{
    //create array and sort
    NSArray *a = @[@1,@4,@5,@5,@11,@14,@6,@7];
    NSArray *c = [CESorting mergeSortArrayWithInputArray:a];
    
    XCTAssertTrue([self arrayIsOrderedWithInputArray:c ordered:NSOrderedAscending],@"array is not in ascending order");
    
}

//test bubble sort
- (void)testSorting_testBubbleSort
{
    //create array and sort
    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:@[@1,@4,@5,@5,@11,@14,@6,@7]];
    NSArray *c = [CESorting bubbleSortArrayWithInputArray:a];
    
    XCTAssertTrue([self arrayIsOrderedWithInputArray:c ordered:NSOrderedAscending],@"array is not in ascending order");
    
}

//test selection sort
- (void)testSorting_testSelectionSort
{
    //create array and sort
    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:@[@1,@4,@5,@5,@11,@14,@6,@7]];
    NSArray *c = [CESorting selectionSortArrayWithInputArray:a];
    
    XCTAssertTrue([self arrayIsOrderedWithInputArray:c ordered:NSOrderedAscending],@"array is not in ascending order");
    
}

//test selection sort
- (void)testSorting_testQuickSort
{
    //create array and sort
    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:@[@1,@4,@5,@8,@11,@14,@6,@7]];
    NSArray *c = [CESorting quickSortArrayWithInputArray:a size:[a count] initialIndex:0];
    
    XCTAssertTrue([self arrayIsOrderedWithInputArray:c ordered:NSOrderedAscending],@"array is not in ascending order");
    
}

//test bucket sort
- (void)testSorting_testBucketSort
{
    //create array and sort
    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:@[@1,@4,@5,@8,@11,@14,@6,@7]];
    NSArray *c = [CESorting bucketSortArrayWithInputArray:a numberOfBuckets:15];
    
    XCTAssertTrue([self arrayIsOrderedWithInputArray:c ordered:NSOrderedAscending],@"array is not in ascending order");
    
}

//test ordering of array
- (BOOL)arrayIsOrderedWithInputArray:(NSArray *)inputArray ordered:(NSComparisonResult)ordered
{
    
    NSNumber *previousInt = (ordered == NSOrderedAscending)?@0:[NSNumber numberWithInt:INT16_MAX];
    
    //tests to make sure array is int order
    for(int i = 0; i < [inputArray count]; i++){
        
        NSComparisonResult ordering = [previousInt compare:inputArray[i]];
        
        //if value isn't the same or ascending from previous, return NO
        if(!(ordering == (ordered) || ordering == NSOrderedSame))
            return NO;
        
        previousInt = inputArray[i];
        
    }
    
    return YES;
}

//test selection sort of nsstring
- (void)testSorting_testSelectionSortString
{
    
    NSString *string = @"cats";
    XCTAssertTrue([[CESorting selectionSortWithInputString:string] isEqualToString:@"acst"],
                  @"selection sort string did not return correct string in correct order");
    
    NSString *string2 = @"987654321";
    XCTAssertTrue([[CESorting selectionSortWithInputString:string2] isEqualToString:@"123456789"],
                  @"selection sort string did not return correct string in correct order");
    
}

//9.2
//- Write a method to sort an array of strings so that all the anagrams are next to each other
- (void)testSorting_testSortingAnagramStrings
{
    NSArray *inputArray  = @[@"obb",@"tsac",@"bbo",@"cats",@"bob",@"wowe",@"scat"];
    NSArray *comparisonArray = @[@"obb",@"bbo",@"bob",@"wowe",@"tsac",@"cats",@"scat"];
    
    //sort array
    NSArray *outputArray = [CESorting orderAnagramsWithInputArray:inputArray];
    
    XCTAssertTrue([self stringsInArrayAreInSameOrderWithFirstArray:outputArray secondArray:comparisonArray],
                  @"strings in the returned array are not in the correct order");
    
}
/*
 test to see if arrays have the same values in the same order
 array must have string values
 */
- (BOOL)stringsInArrayAreInSameOrderWithFirstArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray
{
    //if the first array and second array are not the same size, return NO
    if([firstArray count] != [secondArray count])
        return NO;
    
    for(int i = 0; i < [firstArray count]; i++)
        if(![firstArray[i] isEqualToString:secondArray[i]])
            return NO;

    return YES;
    
}

//binary search of array
- (void)testSorting_testBinarySearchOfArray
{
    XCTAssertTrue(([CESorting returnIndexOfTarget:@8 withArray:@[@4,@5,@6,@7,@8,@9,@10]]) == 4, @"binary search didn't return correct index");
}


//9.3
//- Given a sorted array of n integers that has been rotated an unknown number of times
//give an O(log n) algorithm that finds an element in the array.
//You may assume that the array was originally sorted in increasing order
- (void)testSorting_testBinarySearchOfArrayWithRotation
{
    NSArray *array = @[@15,@16,@19,@20,@25,@1,@3,@4,@5,@7,@10,@14];
    XCTAssertTrue(([CESorting binarySearchWithArray:array lower:0 upper:[array count]-1 target:@5]) == 8, @"binary search didn't return correct index");
}

//9.5
//- Given a sorted array of strings which is interspersed with empty strings, write a method to find the location of a given string
//Example: find “ball” in [“at”, “”, “”, “”, “ball”, “”, “”, “car”, “”, “”, “dad”, “”, “”] will //return 4
- (void)testSorting_testSearchOfInterspersedArray
{
    NSArray *inputArray  = @[@"at",@"",@"",@"",@"ball",@"",@"",@"car",@"",@"",@"dad",@"",@""];
    XCTAssertTrue([CESorting returnIndexOfTarget:@"dad" interspersedArray:inputArray] == 10, @"binary search didn't return correct index");
    XCTAssertTrue([CESorting returnIndexOfTarget:@"car" interspersedArray:inputArray] == 7, @"binary search didn't return correct index");
    XCTAssertTrue([CESorting returnIndexOfTarget:@"ball" interspersedArray:inputArray] == 4, @"binary search didn't return correct index");
    XCTAssertTrue([CESorting returnIndexOfTarget:@"at" interspersedArray:inputArray] == 0, @"binary search didn't return correct index");
}

@end
