//
//  CEMyQueue.m
//  CodingExercises
//
//  Created by Austin Marusco on 1/3/14.
//  Copyright (c) 2014 Austin Marusco. All rights reserved.
//


#import "CEMyQueue.h"

@interface CEMyQueue ()

@property (nonatomic) CEStack *stack1;
@property (nonatomic) CEStack *stack2;

@end

@implementation CEMyQueue

- (CEMyQueue *)init
{
    self = [super init];
    
    if(self){
        
        _stack1 = [[CEStack alloc] init];
        _stack2 = [[CEStack alloc] init];
        
    }
    
    return self;
    
}

/*
 push object onto stack 1
 */
- (void)enqueueWithObject:(id<NSCopying>)object
{
    [self.stack1 pushWithData:object];
}

/*
 pop all contents from stack1 to stack2
 pop the top value of stack2 and set to tempObject
 pop all contents from stack2 to stack1
 return tempObject
 */
- (id <NSCopying>)dequeue
{
    
    self.stack2 = [self reverseValuesOfStack:self.stack1];
    
    //if stack 2 has any values
    if([self.stack2 peek]){
        
        id <NSCopying>tempObject = [self.stack2 pop];
        
        //return all the contents of stack2 into stack1
        self.stack1 = [self reverseValuesOfStack:self.stack2];
        
        //return tempObject
        return tempObject;
        
    }
    
    return nil;
}

/*
 pops all values from one stack to another
 */
-(CEStack *)reverseValuesOfStack:(CEStack *)stack
{
    
    CEStack *reverseStack = [[CEStack alloc] init];
    
    //continue until fromStack is empty
    while([stack peek]){
        
        //pop from one stack and push to another
        [reverseStack pushWithData:[stack pop]];
        
    }
    
    return reverseStack;
    
}


@end
