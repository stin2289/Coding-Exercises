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

//8.2
//- Imagine a robot sitting on the upper left hand corner of an NxN grid
//The robot can only move in two directions: right and down
//How many possible paths are there for the robot?
- (void)testRecursion_testPathsInGrid
{
    
    XCTAssertEqual(0, [CERecursion possibleMovesInGridWithSizeN:1 xPosition:0 yPosition:0], @"number of paths returned is not correct");
    XCTAssertEqual(4, [CERecursion possibleMovesInGridWithSizeN:2 xPosition:0 yPosition:0], @"number of paths returned is not correct");
    XCTAssertEqual(18, [CERecursion possibleMovesInGridWithSizeN:3 xPosition:0 yPosition:0], @"number of paths returned is not correct");
       
}

//8.3
//- Write a method that returns all subsets of a set
- (void)testRecursion_testReturnSubsets
{
    
    NSSet *newSet = [NSSet setWithObjects:@1,@2,@3,@4, nil];
    
    NSMutableArray *subsets = [CERecursion returnSubsetsOfSet:newSet];
    
    //loop through subsets and print
    for(NSSet *subset in subsets){
        for(id object in subset){
         //   printf("%i" ,[((NSNumber *)object) intValue]);
        }
        //printf("\n");
        
    }
    
    
}

//8.4
//- Write a method to compute all permutations of a string
- (void)testRecursion_testReturnPermutationsOfString
{
    
    NSMutableArray *permutations = [CERecursion getPermutationsOfString:@"two"];
    
    XCTAssertTrue([permutations containsObject:@"two"] &&
                  [permutations containsObject:@"tow"] &&
                  [permutations containsObject:@"wto"] &&
                  [permutations containsObject:@"wot"] &&
                  [permutations containsObject:@"owt"] &&
                  [permutations containsObject:@"otw"] && [permutations count] == 6, @"permutations array doesn't contain correct values");
    
}



@end
