//
//  CERecursionTests.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/19/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CERecursion.h"

@interface CERecursionTests : XCTestCase

@end

@implementation CERecursionTests

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


//8.1
//- Write a method to generate the nth Fibonacci number
//1,1,2,3,5,8,13,21,34
- (void)testRecursion_testFibonacciSequence
{
    
    XCTAssertEqual(34, [CERecursion generateNthFibonacciNumberWithN:8], @"method didn't generate the correct fibonacci sequence number");
    XCTAssertEqual(6765, [CERecursion generateNthFibonacciNumberWithN:19], @"method didn't generate the correct fibonacci sequence number");
    
}

@end
