//
//  CEMyQueue.h
//  CodingExercises
//
//  Created by Austin Marusco on 1/3/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "CEStack.h"

@interface CEMyQueue: NSObject

- (instancetype)init;

/*
 push object onto stack 1
 */
- (void)enqueueWithObject:(id)object;

/*
 pop all contents from stack1 to stack2
 pop the top value of stack2 and set to tempObject
 pop all contents from stack2 to stack1
 return tempObject
 */
- (id)dequeue;

@end

