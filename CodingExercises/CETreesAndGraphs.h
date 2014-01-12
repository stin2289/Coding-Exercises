//
//  CETreesAndGraphs.h
//  CodingExercises
//
//  Created by Austin Marusco on 1/7/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CETreeNode.h"

@interface CETreesAndGraphs : NSObject

/*
 calculate max depth
 */
+ (int)maxDepth:(CETreeNode *)node;

/*
 calculate min depth
 */
+ (int)minDepth:(CETreeNode *)node;

/*
 is tree balanced?
 left and right depths equal
 */
+ (BOOL)isBalanced:(CETreeNode *)root;

/*
 depth first traversal
 */
+ (void)depthFirstPreorderTraversalWithNode:(CETreeNode *)node;
+ (void)depthFirstInorderTraversalWithNode:(CETreeNode *)node;
+ (void)depthFirstPostorderTraversalWithNode:(CETreeNode *)node;

/*
 depth first traversal with stack
 pre-order
 */
+ (void)depthFirstTraversalUsingStackWithNode:(CETreeNode *)node;

/*
 breadth first traversal with queue
 */
+ (void)breadthFirstTraversalUsingQueueWithNode:(CETreeNode *)node;

//4.2
//- Given a directed graph, design an algorithm to find out whether there is a route between two nodes
/*
 determines if there is a route between any two nodes
 */
+ (BOOL)isRouteBetweenTwoNodesWithFirstNode:(CETreeNode *)firstNode secondNode:(CETreeNode *)secondNode;

//4.3
/*
 creates tree with minimal height
 */
+ (CETreeNode *)createTreeWithMinimalHeightWithArray:(NSArray *)array;

//- 4.4 Given a binary search tree, design an algorithm which creates a linked list of all the nodes at each depth (i e , if you have a tree with depth D, you’ll have D linked lists)
/*
 create linked list from tree node
 */
+ (NSMutableArray *)createLinkedListsFromNode:(CETreeNode *)node;


@end
