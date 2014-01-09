//
//  CETreeNode.h
//  CodingExercises
//
//  Created by Austin Marusco on 1/7/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CETreeNode : NSObject <NSCopying>

@property (nonatomic) int data;

@property (nonatomic) CETreeNode *left;
@property (nonatomic) CETreeNode *right;

@end
