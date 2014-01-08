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


@end
