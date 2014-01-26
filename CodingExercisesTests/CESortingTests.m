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




@end
