//
//  CETreesAndGraphs.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/7/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CETreesAndGraphs.h"

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

@end
