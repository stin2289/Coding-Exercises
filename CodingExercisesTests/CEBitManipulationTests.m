//
//  CEBitManipulationTests.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/12/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CEBitManipulation.h"

@interface CEBitManipulationTests : XCTestCase

@end

@implementation CEBitManipulationTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//5.1
//- You are given two 32-bit numbers, N and M, and two bit positions, i and j
//Write a method to set all bits between i and j in N equal to M (e g , M becomes a substring of N //located at i and starting at j)
//EXAMPLE:
//Input:  N = 100 0000 0000
//M = 10101
//i = 2
//j = 6
//Output: N = 100 0101 0100
//4 + 16 + 64 + 1024 = 1108
- (void)testBitManipulation_testInsertBits
{
    
    int n = pow(2,10);
    int m = 21;
    int i = 2;
    int j = 6;
    
    XCTAssertEqual([CEBitManipulation insertBitsWithN:n m:m i:i j:j], 1108, @"bit manipulation didn't return correct int");
    
    //test harder case of n, 100 0001 1000
    n = n + 16 + 8;
    XCTAssertEqual([CEBitManipulation insertBitsWithN:n m:m i:i j:j], 1108, @"bit manipulation didn't return correct int");
    
}



@end
