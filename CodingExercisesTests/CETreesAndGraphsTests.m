//
//  CETreesAndGraphs.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/7/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CETreeNode.h"
#import "CETreesAndGraphs.h"

@interface CETreesAndGraphsTests : XCTestCase

@end

@implementation CETreesAndGraphsTests

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


//4.1
//Implement a function to check if a tree is balanced
//For the purposes of this question, a balanced tree is defined to be a tree such that no two leaf //nodes differ in distance from the root by more than one
- (void)testTreesAndGraphs_isTreeBalanced
{
    //create nodes
    CETreeNode *root = [[CETreeNode alloc] init];
    root.data = 0;
    
    CETreeNode *node1 = [[CETreeNode alloc] init];
    node1.data = 1;
    
    CETreeNode *node2 = [[CETreeNode alloc] init];
    node2.data = 2;
    
    CETreeNode *node3 = [[CETreeNode alloc] init];
    node3.data = 3;
    
    CETreeNode *node4 = [[CETreeNode alloc] init];
    node4.data = 4;
    
    CETreeNode *node5 = [[CETreeNode alloc] init];
    node5.data = 5;
    
    //set root
    root.left = node1;
    root.right = node2;
    
    //set rest of nodes
    node1.left = node3;
    node1.right = node4;
    node2.left = node5;
    
    XCTAssertTrue([CETreesAndGraphs isBalanced:root],@"tree should be balanced");
    
    //create unbalanced tree
    node2.left = nil;
    node3.left = node5;
    
    XCTAssertFalse([CETreesAndGraphs isBalanced:root], @"tree should not be balanced");
    
}

/*
 depth first
 */
- (void)testTreesAndGraphs_depthFirstTesting
{
    //create nodes
    CETreeNode *root = [[CETreeNode alloc] init];
    root.data = 0;
    
    CETreeNode *node1 = [[CETreeNode alloc] init];
    node1.data = 1;
    
    CETreeNode *node2 = [[CETreeNode alloc] init];
    node2.data = 2;
    
    CETreeNode *node3 = [[CETreeNode alloc] init];
    node3.data = 3;
    
    CETreeNode *node4 = [[CETreeNode alloc] init];
    node4.data = 4;
    
    CETreeNode *node5 = [[CETreeNode alloc] init];
    node5.data = 5;
    
    CETreeNode *node6 = [[CETreeNode alloc] init];
    node6.data = 6;
    
    //assign nodes children
    root.left = node1;
    root.right = node2;
    node1.left = node3;
    node1.right = node4;
    node2.left = node5;
    node2.right = node6;
    
    NSLog(@"\n\n depthFirst preOrder");
    [CETreesAndGraphs depthFirstPreorderTraversalWithNode:root];
    
    NSLog(@"\n\n depthFirst inOrder");
    [CETreesAndGraphs depthFirstInorderTraversalWithNode:root];
    
    NSLog(@"\n\n depthFirst depthFirstOrder");
    [CETreesAndGraphs depthFirstPostorderTraversalWithNode:root];
    
}

@end
