//
//  CETreeNode.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/7/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//

#import "CETreeNode.h"

@implementation CETreeNode

- (CETreeNode *)init
{
    self = [super init];
    
    if(self){
        _data = 0;
        _left = nil;
        _right = nil;
    }
    
    return self;
    
}

- (id)copyWithZone:(NSZone *)zone
{
    CETreeNode *newNode = [[CETreeNode alloc] init];
    
    //copy current values
    newNode.data = self.data;
    newNode.left = self.left;
    newNode.right = self.right;
    
    return self;
    
}

@end
