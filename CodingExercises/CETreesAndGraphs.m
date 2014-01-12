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
#import "CELinkedNode.h"

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
        
        NSLog(@"%@",node.data);
        
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
        
        NSLog(@"%@",node.data);
        
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
        
        NSLog(@"%@",node.data);
        
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
        
        NSLog(@"value %@",currentNode.data);
        
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
        
        NSLog(@"value %@",currentNode.data);
        
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


//4.2
//- Given a directed graph, design an algorithm to find out whether there is a route between two nodes
/*
 determines if there is a route between any two nodes
 */
+ (BOOL)isRouteBetweenTwoNodesWithFirstNode:(CETreeNode *)firstNode secondNode:(CETreeNode *)secondNode
{
    //create data structures
    CETreeNode *currentNode;
    CEQueue *queue = [[CEQueue alloc] init];
    
    int index = 0;
    
    //loop through nodes
    while(true){
        
        if(index == 0)
            //first time run with firstNode
            [queue enqueueWithData:firstNode];
        else if(index == 1)
            //second time run with secondNode
            [queue enqueueWithData:secondNode];
        else
            //third time break
            break;
        
        
        //while queue is not empty
        while(queue.front)
        {
            
            currentNode = (CETreeNode *)[queue dequeue];
            
            //if the current node is allocated
            if(currentNode){
                
                //if the current node is equal to the first node
                if(currentNode == firstNode){
                    
                    //if the node is a child, return YES
                    if([self isChildNodeWithRoot:firstNode childNode:secondNode])
                        return YES;
                    
                }
                else if(currentNode == secondNode){
                    
                    //if the node is a child, return YES
                    if([self isChildNodeWithRoot:secondNode childNode:firstNode])
                        return YES;
                    
                }
                
                //enqueue remaining children
                [queue enqueueWithData:currentNode.left];
                [queue enqueueWithData:currentNode.right];
                
            }
            
        }
        
        index++;
        
    }
    
    //return NO if the two nodes don’t have a path between them
    return NO;
    
}

/*
 determines if node is a child of the root
 */
+ (BOOL)isChildNodeWithRoot:(CETreeNode *)root childNode:(CETreeNode *)childNode
{
    
    //create data structures
    CETreeNode *currentNode;
    CEQueue *queue = [[CEQueue alloc] init];
    
    //add node to queue
    [queue enqueueWithData:root];
    
    //while queue is not empty
    while(queue.front)
    {
        
        currentNode = (CETreeNode *)[queue dequeue];
        
        //if the current node is allocated
        if(currentNode){
            
            //if current node is equal to the child note
            if(currentNode == childNode)
                return YES;
            
            //enqueue children
            [queue enqueueWithData:currentNode.left];
            [queue enqueueWithData:currentNode.right]; 
            
        }
        
    }
    
    //return no if childNode is not found
    return NO;
    
}


//4.3
/*
 creates tree with minimal height
 */
+ (CETreeNode *)createTreeWithMinimalHeightWithArray:(NSArray *)array
{
    
    //create queues
    CEQueue *queueOfValues = [[CEQueue alloc] init];
    CEQueue *queueOfNodes = [[CEQueue alloc] init];
    
    CETreeNode *currentNode;
    
    //put all array values in queue
    for(NSNumber *number in array)
        [queueOfValues enqueueWithData:number];
    
    CETreeNode *rootNode = [[CETreeNode alloc] init];
    rootNode.data = [queueOfValues dequeue];
    
    //enqueue first value
    [queueOfNodes enqueueWithData:rootNode];
    
    //while the queueOfNodes has values
    while(queueOfNodes.front){
        
        currentNode = (CETreeNode *)[queueOfNodes dequeue];
        
        //if the current node is not nil
        if(currentNode){
            
            //if values available
            if(queueOfValues.front){
                
                //create left child
                CETreeNode *node = [[CETreeNode alloc] init];
                node.data = [queueOfValues dequeue];
                currentNode.left = node;
                
                //enqueue node for creation
                [queueOfNodes enqueueWithData:node];
                
            }
            //stop
            else return rootNode;
            
            //if values available
            if(queueOfValues.front){
                
                //create right child
                CETreeNode *node = [[CETreeNode alloc] init];
                node.data = [queueOfValues dequeue];
                currentNode.right = node;
                
                //enqueue node for creation
                [queueOfNodes enqueueWithData:node];
                
            }
            //stop
            else
                return rootNode;
            
        }
        
    }
    
    
    return rootNode;
    
}


//- 4.4 Given a binary search tree, design an algorithm which creates a linked list of all the nodes at each depth (i e , if you have a tree with depth D, you’ll have D linked lists)
/*
 create linked list from tree node
 */
+ (NSMutableArray *)createLinkedListsFromNode:(CETreeNode *)node
{
    
    int level = 0;
    int currentLevelNodeCount = 0;
    
    //create DFS variables
    CETreeNode *currentNode;
    CEQueue *queue = [[CEQueue alloc] init];
    
    //create array of linked lists
    NSMutableArray *arrayOfLinkedLists = [NSMutableArray new];
    
    //create current linkedList
    CELinkedNode *currentLinkedListHead;
    CELinkedNode *currentLinkedNode;
    
    //enqueue first node
    [queue enqueueWithData:node];
    
    
    //while queue has values
    while(queue.front){
        
        currentNode = (CETreeNode *)[queue dequeue];
        
        //if the current node is not nil
        if(currentNode){
            
            //if the current node is set
            if(currentLinkedNode){
                
                //set the next node
                currentLinkedNode.next = [[CELinkedNode alloc] initWithData:currentNode];
                //set current node to next node
                currentLinkedNode = currentLinkedNode.next;
                
            }
            //if the current node is not set
            
            else{
                
                //set the head and the current node
                currentLinkedListHead = [[CELinkedNode alloc] initWithData:currentNode];
                currentLinkedNode = currentLinkedListHead;
                
            }
            
            
            //enqueue children
            [queue enqueueWithData:currentNode.left];
            [queue enqueueWithData:currentNode.right];
            
            currentLevelNodeCount++;
            
            //if the current level of nodes have been traversed
            if(currentLevelNodeCount >= pow(2,level)){
                
                level++;
                currentLevelNodeCount = 0;
                
                //add current linked list to array
                [arrayOfLinkedLists addObject:currentLinkedListHead];
                
                //set current linkedList head to nil
                currentLinkedListHead = nil;
                currentLinkedNode = nil;
                
            }
            
        }
        
    }
    
    //if the current linkedlist head is allocated
    if(currentLinkedListHead)
        //add current linked list to array
        [arrayOfLinkedLists addObject:currentLinkedListHead];
    
    return arrayOfLinkedLists;
    
}



@end
