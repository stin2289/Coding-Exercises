//
//  CETreesAndGraphs.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/7/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CETreesAndGraphs.h"
#import "CEStack.h"
#import "CEQueue.h"

@implementation CETreesAndGraphs

/*
 calculate max depth
 */
+ (int)maxDepth:(CETreeNode *)node
{
    //if the node is nil, return 0
    if(!node)
        return 0;
    
    return 1 + MAX([self maxDepth:node.left],[self maxDepth:node.right]);
    
}

/*
 calculate min depth
 */
+ (int)minDepth:(CETreeNode *)node
{
    //if the node is nil, return 0
    if(!node)
        return 0;
    
    return 1 + MIN([self minDepth:node.left],[self minDepth:node.right]);
    
}

/*
 is tree balanced?
 left and right depths equal
 */
+ (BOOL)isBalanced:(CETreeNode *)root
{
    int maxDepth = [self maxDepth:root];
    int minDepth = [self minDepth:root];
    
    return (maxDepth - minDepth <= 1);
}

#pragma mark - traversal


/*
 depth first
 pre order
 */
+ (void)depthFirstPreorderTraversalWithNode:(CETreeNode *)node
{
    
    //if the node is not nil
    if(node){
     
        NSLog(@"%i",node.data);
        
        //left
        [self depthFirstPreorderTraversalWithNode:node.left];
        
        //right
        [self depthFirstPreorderTraversalWithNode:node.right];
        
    }
    
}

/*
 depth first
 in order
 */
+ (void)depthFirstInorderTraversalWithNode:(CETreeNode *)node
{
    
    //if the node is not nil
    if(node){
        
        //left
        [self depthFirstPreorderTraversalWithNode:node.left];
        
        NSLog(@"%i",node.data);
        
        //right
        [self depthFirstPreorderTraversalWithNode:node.right];
        
    }
    
}

/*
 depth first 
 post order
 */
+ (void)depthFirstPostorderTraversalWithNode:(CETreeNode *)node
{
    
    //if the node is not nil
    if(node){
        
        //left
        [self depthFirstPreorderTraversalWithNode:node.left];
        
        //right
        [self depthFirstPreorderTraversalWithNode:node.right];
        
        NSLog(@"%i",node.data);
        
    }
    
}

/*
 depth first traversal with stack
 pre-order
 */
+ (void)depthFirstTraversalUsingStackWithNode:(CETreeNode *)node
{
    //init variables
    CETreeNode *currentNode = node;
    CEStack *stack = [[CEStack alloc] init];
    
    //push first value
    [stack pushWithData:currentNode];
    
    //while the stack has a value
    while([stack peek]){
        
        //pop top value
        currentNode = (CETreeNode *)[stack pop];
        
        NSLog(@"value %i",currentNode.data);
        
        /*
         push right value first, so the it traverses the tree from left to right(FILO)
         */
        
        //if node exists, push on stack
        if(currentNode.right)
            [stack pushWithData:currentNode.right];
        
        //if node exists, push on stack
        if(currentNode.left)
            [stack pushWithData:currentNode.left];
        
    }
    
}

/*
 breadth first traversal with queue
 */
+ (void)breadthFirstTraversalUsingQueueWithNode:(CETreeNode *)node
{
    //init variables
    CETreeNode *currentNode = node;
    CEQueue *queue = [[CEQueue alloc] init];
    
    //push first value
    [queue enqueueWithData:currentNode];
    
    //while queue has a value
    while(queue.front){
        
        //pop top value
        currentNode = (CETreeNode *)[queue dequeue];
        
        NSLog(@"value %i",currentNode.data);
        
        /*
         enqueue left value first, so the it traverses the tree from left to right(FIFO)
         */
        
        //if node exists, push on queue
        if(currentNode.left)
            [queue enqueueWithData:currentNode.left];
        
        //if node exists, push on queue
        if(currentNode.right)
            [queue enqueueWithData:currentNode.right];
        
    }
    
}

@end
