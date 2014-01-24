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
    
    NSNumber *previousInt = @0;
    
    //tests to make sure array is int order
    for(int i = 0; i < [a count] + [b count] - 1; i++){
        NSInteger ordering = [c[i] compare:previousInt];
        XCTAssertTrue(ordering == NSOrderedDescending || ordering == NSOrderedSame,@"current index is not greater than previous index");
        previousInt = c[i];
    }
    
}

//test merge sort
- (void)testSorting_testMergeSort
{
    //create array and sort
    NSArray *a = @[@1,@4,@5,@5,@11,@14,@6,@7];
    NSArray *c = [CESorting mergeSortArrayWithInputArray:a];
    
    NSNumber *previousInt = @0;
    
    //tests to make sure array is int order
    for(int i = 0; i < [a count]; i++){
        NSInteger ordering = [c[i] compare:previousInt];
        XCTAssertTrue(ordering == NSOrderedDescending || ordering == NSOrderedSame,@"current index is not greater than previous index");
        previousInt = c[i];
    }
    
    
}



@end
