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
#import "CELinkedNode.h"

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
    root.data = @0;
    
    CETreeNode *node1 = [[CETreeNode alloc] init];
    node1.data = @1;
    
    CETreeNode *node2 = [[CETreeNode alloc] init];
    node2.data = @2;
    
    CETreeNode *node3 = [[CETreeNode alloc] init];
    node3.data = @3;
    
    CETreeNode *node4 = [[CETreeNode alloc] init];
    node4.data = @4;
    
    CETreeNode *node5 = [[CETreeNode alloc] init];
    node5.data = @5;
    
    CETreeNode *node6 = [[CETreeNode alloc] init];
    node6.data = @6;
    
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
 tree traversal
 depth first
 breadth first
 */
- (void)testTreesAndGraphs_depthFirstTesting
{
    //create nodes
    CETreeNode *root = [[CETreeNode alloc] init];
    root.data = @0;
    
    CETreeNode *node1 = [[CETreeNode alloc] init];
    node1.data = @1;
    
    CETreeNode *node2 = [[CETreeNode alloc] init];
    node2.data = @2;
    
    CETreeNode *node3 = [[CETreeNode alloc] init];
    node3.data = @3;
    
    CETreeNode *node4 = [[CETreeNode alloc] init];
    node4.data = @4;
    
    CETreeNode *node5 = [[CETreeNode alloc] init];
    node5.data = @5;
    
    CETreeNode *node6 = [[CETreeNode alloc] init];
    node6.data = @6;
    
    //assign nodes children
    root.left = node1;
    root.right = node2;
    node1.left = node3;
    node1.right = node4;
    node2.left = node5;
    node2.right = node6;
    
    /*
     uncomment lines to test
     */
    
    /*
    NSLog(@"\n\n depthFirst preOrder");
    [CETreesAndGraphs depthFirstPreorderTraversalWithNode:root];
     */
    
    /*
    NSLog(@"\n\n depthFirst inOrder");
    [CETreesAndGraphs depthFirstInorderTraversalWithNode:root];
     */
    
    /*
    NSLog(@"\n\n depthFirst depthFirstOrder");
    [CETreesAndGraphs depthFirstPostorderTraversalWithNode:root];
     */
    
    /*
    NSLog(@"\n\n depthFirst preOrder with stack");
    [CETreesAndGraphs depthFirstTraversalUsingStackWithNode:root];
     */
    
    /*
    NSLog(@"\n\n breadthFirst with queue");
    [CETreesAndGraphs breadthFirstTraversalUsingQueueWithNode:root];
     */
    
}

//4.2
//- Given a directed graph, design an algorithm to find out whether there is a route between two nodes
/*
 determines if there is a route between any two nodes
 */
- (void)testTreesAndGraphs_testIfTwoNodesSharePath
{
    
    //create nodes
    CETreeNode *root = [[CETreeNode alloc] init];
    root.data = @0;
    
    CETreeNode *node1 = [[CETreeNode alloc] init];
    node1.data = @1;
    
    CETreeNode *node2 = [[CETreeNode alloc] init];
    node2.data = @2;
    
    CETreeNode *node3 = [[CETreeNode alloc] init];
    node3.data = @3;
    
    CETreeNode *node4 = [[CETreeNode alloc] init];
    node4.data = @4;
    
    CETreeNode *node5 = [[CETreeNode alloc] init];
    node5.data = @5;
    
    CETreeNode *node6 = [[CETreeNode alloc] init];
    node6.data = @6;
    
    //assign nodes children
    root.left = node1;
    root.right = node2;
    node1.left = node3;
    node1.right = node4;
    node2.left = node5;
    node2.right = node6;
    
    XCTAssertFalse([CETreesAndGraphs isRouteBetweenTwoNodesWithFirstNode:node1 secondNode:node6], @"the two nodes should not have a route between them");
    XCTAssertTrue([CETreesAndGraphs isRouteBetweenTwoNodesWithFirstNode:root secondNode:node6], @"the two nodes should have a route between them");
    XCTAssertTrue([CETreesAndGraphs isRouteBetweenTwoNodesWithFirstNode:node2 secondNode:node6], @"the two nodes should have a route between them");
    //test reverse
    XCTAssertTrue([CETreesAndGraphs isRouteBetweenTwoNodesWithFirstNode:node6 secondNode:root], @"the two nodes should have a route between them");
    XCTAssertTrue([CETreesAndGraphs isRouteBetweenTwoNodesWithFirstNode:node6 secondNode:node2], @"the two nodes should have a route between them");
    
}

//4.3
/*
 creates tree with minimal height
 */
- (void)testTreesAndGraphs_testCreateTreeWithMinimalHeight
{
    /*
    NSArray *array = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20];
    
    //create tree
    
    CETreeNode *root = [CETreesAndGraphs createTreeWithMinimalHeightWithArray:array];
    
    //print tree
    
    NSLog(@"\n\n createdTree, breadthFirst search with queue");
    [CETreesAndGraphs breadthFirstTraversalUsingQueueWithNode:root];
     */
    
}

//- 4.4 Given a binary search tree, design an algorithm which creates a linked list of all the nodes at each depth (i e , if you have a tree with depth D, you’ll have D linked lists)
/*
 create linked list from tree node
 */
- (void)testTreesAndGraphs_testCreateLinkedListsWithTreeNode
{
    //create tree
    NSArray *array = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20];
    CETreeNode *root = [CETreesAndGraphs createTreeWithMinimalHeightWithArray:array];
    
    //create linked lists
    NSMutableArray *arrayOfLinkedLists = [CETreesAndGraphs createLinkedListsFromNode:root];
    
    int i = 0;
    
    //loop through all linked lists
    for(CELinkedNode *object in arrayOfLinkedLists){
        
       // NSLog(@"\n\nlevel %i",i);
        
        CELinkedNode *currentLinkedNode = object;
        
        //traverse linked list
        while(currentLinkedNode){
            
            //print current linkedNode
         //   NSLog(@"node %@",((CETreeNode *)currentLinkedNode.data).data);
            //set currentLinkedNode to nextLinkedNode
            currentLinkedNode = currentLinkedNode.next;
            
        }
        
        i++;
        
    }
    
}




@end
