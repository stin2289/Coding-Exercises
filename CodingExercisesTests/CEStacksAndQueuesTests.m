//
//  CEStacksAndQueues.m
//  CodingExercises
//
//  Created by Austin Marusco on 12/19/13.
//  Copyright (c) 2013 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CEStack.h"
#import "CEQueue.h"
#import "CEStacksAndQueues.h"
#import "CEStackWithMinimum.h"
#import "CESetOfStacks.h"

@interface CEStacksAndQueuesTests : XCTestCase

@end

@implementation CEStacksAndQueuesTests

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

//test functionality of stack
- (void)testStacksAndQueues_testStackIsWorking
{
    CEStack *stack = [[CEStack alloc] init];

    [stack pushWithData:@0];
    [stack pushWithData:@1];
    [stack pushWithData:@2];
    [stack pushWithData:@3];
    [stack pushWithData:@4];
    
    
    XCTAssertTrue([((NSNumber *)[stack pop]) isEqualToNumber:@4],@"correct value isn't popped");
    XCTAssertTrue([((NSNumber *)[stack pop]) isEqualToNumber:@3],@"correct value isn't popped");
    XCTAssertTrue([((NSNumber *)[stack pop]) isEqualToNumber:@2],@"correct value isn't popped");
    XCTAssertTrue([((NSNumber *)[stack pop]) isEqualToNumber:@1],@"correct value isn't popped");
    XCTAssertTrue([((NSNumber *)[stack pop]) isEqualToNumber:@0],@"correct value isn't popped");
    
    
}

//test functionality of queue
- (void)testStacksAndQueues_testQueueIsWorking
{
    CEQueue *queue = [[CEQueue alloc] init];
    
    [queue enqueueWithData:@(0)];
    [queue enqueueWithData:@(1)];
    [queue enqueueWithData:@(2)];
    [queue enqueueWithData:@(3)];
    
    XCTAssertEqual([queue dequeue], @(0), @"correct value isn't popped");
    XCTAssertEqual([queue dequeue], @(1), @"correct value isn't popped");
    XCTAssertEqual([queue dequeue], @(2), @"correct value isn't popped");
    XCTAssertEqual([queue dequeue], @(3), @"correct value isn't popped");
    
    
}

//3.2
//How would you design a stack which, in addition to push and pop, also has a function min which returns the minimum element?
//Push, pop and min should all operate in O(1) time
- (void)testStacksAndQueues_testStackWithMinimumIsWorking
{
    //create stack
    CEStackWithMinimum *stack = [[CEStackWithMinimum alloc] init];
    
    //push and pop values while checking minimum throughout
    [stack pushWithData:@10];
    
    XCTAssertEqual(stack.minimum,@10, @"minimum isn't correct");
    
    [stack pushWithData:@11];
    
    XCTAssertEqual(stack.minimum,@10, @"minimum isn't correct");
    
    [stack pushWithData:@5];
    
    XCTAssertEqual(stack.minimum,@5, @"minimum isn't correct");
    
    [stack pop];
    
    XCTAssertEqual(stack.minimum,@10, @"minimum isn't correct");
    
    [stack pop];
    
    XCTAssertEqual(stack.minimum,@10, @"minimum isn't correct");
    
    [stack pop];
    
    XCTAssertFalse(stack.minimum, @"minimum isn't correct");
    
    
}


//3.3
//- Imagine a (literal) stack of plates
//If the stack gets too high, it might topple
//Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold
//Implement a data structure SetOfStacks that mimics this
//SetOfStacks should be composed of several stacks, and should create a new stack once the previous one exceeds capacity
//SetOfStacks push() and SetOfStacks pop() should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack)
- (void)testStacksAndQueues_testSetOfStacksIsWorking
{
    //create set of stacks
    CESetOfStacks *setOfStacks = [[CESetOfStacks alloc] initWithThreshold:4];
    
    [setOfStacks pushWithData:@0];
    [setOfStacks pushWithData:@1];
    [setOfStacks pushWithData:@2];
    [setOfStacks pushWithData:@3];
    
    XCTAssertEqual([setOfStacks pop], @3, @"popped value isn't correct");
    
    [setOfStacks pushWithData:@4];
    [setOfStacks pushWithData:@5];
    [setOfStacks pushWithData:@6];
    
    XCTAssertEqual([setOfStacks pop], @6, @"popped value isn't correct");
    XCTAssertEqual([setOfStacks pop], @5, @"popped value isn't correct");
    XCTAssertEqual([setOfStacks pop], @4, @"popped value isn't correct");
    XCTAssertEqual([setOfStacks pop], @2, @"popped value isn't correct");
    XCTAssertEqual([setOfStacks pop], @1, @"popped value isn't correct");
    XCTAssertEqual([setOfStacks pop], @0, @"popped value isn't correct");
    XCTAssertFalse([setOfStacks pop], @"popped value isn't correct");
    
}



@end
