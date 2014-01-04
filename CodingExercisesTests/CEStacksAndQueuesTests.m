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
#import "CETowersOfHanoi.h"
#import "CEMyQueue.h"
#import "CEStack+Sorting.h"

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


////3.4
//- In the classic problem of the Towers of Hanoi, you have 3 rods and N disks of different sizeswhichcanslideontoanytower Thepuzzlestartswithdiskssortedinascending order of size from top to bottom (e g , each disk sits on top of an even larger one) You have the following constraints:
//(A) Only one disk can be moved at a time
//(B) A disk is slid off the top of one rod onto the next rod
//(C) A disk can only be placed on top of a larger disk
//Write a program to move the disks from the first rod to the last using Stacks
- (void)testStacksAndQueues_testTowersOfHanoi
{
    CETowersOfHanoi *towersOfHanoi = [[CETowersOfHanoi alloc] initWithNumberOfDisks:7];
    
    //run towers of hanoi
    CEStack *finalStack = [towersOfHanoi run];
    
    NSLog(@"finalSTack %@",finalStack);
//    XCTAssertEqual(((NSNumber *)finalStack.top.data),@1, @"stack doesn't have correct value");
//    XCTAssertEqual(((NSNumber *)finalStack.top.next.data),@2, @"stack doesn't have correct value");
//    XCTAssertEqual(((NSNumber *)finalStack.top.next.next.data),@3, @"stack doesn't have correct value");
    
}


//3.5
//Implement a MyQueue class which implements a queue using two stacks
- (void)testStacksAndQueues_testQueueOfStacks
{
    CEMyQueue *queue = [[CEMyQueue alloc] init];
    
    [queue enqueueWithObject:@0];
    [queue enqueueWithObject:@1];
    [queue enqueueWithObject:@2];
    [queue enqueueWithObject:@3];
    [queue enqueueWithObject:@4];
    [queue enqueueWithObject:@5];
    [queue enqueueWithObject:@6];
    
    
    XCTAssertEqual([queue dequeue], @0, @"queue didn't return correct variable");
    XCTAssertEqual([queue dequeue], @1, @"queue didn't return correct variable");
    XCTAssertEqual([queue dequeue], @2, @"queue didn't return correct variable");
    XCTAssertEqual([queue dequeue], @3, @"queue didn't return correct variable");
    XCTAssertEqual([queue dequeue], @4, @"queue didn't return correct variable");
    XCTAssertEqual([queue dequeue], @5, @"queue didn't return correct variable");
    XCTAssertEqual([queue dequeue], @6, @"queue didn't return correct variable");
    XCTAssertNil([queue dequeue], @"queue didn't return correct variable");
    
}


//3.6
//Write a program to sort a stack in ascending order.
//You should not make any assumptions about how the stack is implemented
//The following are the only functions that should be used to write this program:
//push | pop | peek | isEmpty
- (void)testStacksAndQueues_testSortingStack
{
    CEStack *stack = [[CEStack alloc] init];
    
    [stack pushWithData:@0];
    [stack pushWithData:@1];
    [stack pushWithData:@7];
    [stack pushWithData:@3];
    [stack pushWithData:@4];
    [stack pushWithData:@5];
    [stack pushWithData:@8];
    [stack pushWithData:@32];
    [stack pushWithData:@3];
    [stack pushWithData:@9];
    
    stack = [stack sortedStack];
    
    XCTAssertEqual([stack pop], @0, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @1, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @3, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @3, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @4, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @5, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @7, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @8, @"stack did not return correct value");
    XCTAssertEqual([stack pop], @9, @"stack did not return correct value");
    XCTAssertTrue([(NSNumber *)[stack pop] isEqualToNumber:@32], @"stack did not return correct value");
    
    
}



@end
